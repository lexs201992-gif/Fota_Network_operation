## Informe Forense: Arquitectura C2 Embebida en Silicon (Unisoc/Longcheer/Tsinghua Unigroup)

### 1. Resumen Ejecutivo

Esta investigación documenta la existencia de un módulo de Command-and-Control (C2) embebido en el firmware del Trust Execution Environment (TEE) del SoC UMS9230 (Unisoc Tiger T606/T612), operado a nivel kernel (UID -1) mediante un túnel WireGuard con key hardcoded. El vector fue identificado en dispositivos de producción (Moto G04s, ODM Longcheer) en mercados fuera de China. La infraestructura C2 está distribuida en dos nodos geográficos dentro de la red de China Telecom (Shanghai/AS4812 y Fujian), y el tráfico se camufla mediante endpoints de DNS públicos, Meta Edge MQTT, y NTP. La cadena de responsabilidad corporativa conduce a New Tsinghua Unigroup (holding estatal) como controlador final de Unisoc, diseñador del vector.

**Clasificación:** Informe técnico-forense de carácter defensivo. No constituye denuncia formal.

---

### 2. Alcance y Metodología

| Elemento | Detalle |
|---|---|
| **Dispositivo analizado** | Moto G04s (Unisoc T606/UMS9230, ODM Longcheer) |
| **Técnica** | Captura de tráfico (PCAP), análisis DNS (dig +trace), firmware analysis (TEE dump), correlación con registros corporativos públicos |
| **Fechas de evidencia** | PCAP: 13-jun-2026; dig/SOA: 03-sep-2026; SOA serials: 25-27 ago 2026 |
| **Resolvers usados** | 8.8.8.8 (Google), 1.1.1.1 (Cloudflare) — ambos confirman el mismo resultado |
| **Limitación** | No se realizó análisis estático del firmware completo; la identificación del módulo WireGuard se basa en comportamiento de red observable (UIDs, puertos, timing) y nomenclatura interna visible en particiones |

---

### 3. Hallazgos

#### 3.1 Vector Técnico (Fase 1)

**3.1.1 Módulo C2 en TEE**

| Parámetro | Valor | Evidencia |
|---|---|---|
| TEE | qogirl6 TEE V2.0.1 (Mar 10, 2024) | Firmware dump, partición `system_ext` |
| WireGuard | 1.0.0, Key `56ef134d` (hardcoded) | Firmware dump |
| Nivel de ejecución | Kernel (UID -1) | PCAP, UIDs |
| Interfaz | wg0/tun0, prefix `fd00:2:fd00:1:fd00:1:fd00:1` | PCAP |
| Trigger | "Use location" ON + WiFi scanning | PCAP temporal |
| FOTA que inyectó | `system_ext_fake_Apr2026` (baseband Mar 2025 sin cambios) | Comparación de particiones |

**3.1.2 Matriz de transporte**

| Canal | Endpoint | Puerto | Camuflaje | Estado |
|---|---|---|---|---|
| Primario | `2620:fe::9` (Quad9) | :53 TCP6 | DNS (puerto incorrecto → no es DoT real) | Bloqueado por investigador |
| Alternativo | `1.1.1.1` (Cloudflare) | :853 | DoT legítimo | Activo |
| Fallback | `2a03:2880::` (Meta) | :80/:443 | Edge MQTT / push notifications | Activo (UID 10227) |
| C2 endpoint WG | `fulguris.slion.net` → 117.24.6.122 | :51820 UDP | WireGuard | Activo |
| C2 R&D | `sh-16-52.rnd.longcheer.net` | — | AS4812, China Telecom SH | Activo |
| NTP/C2 | 45.231.168.6 | :123 UDP | NTP (76 bytes, tamaño estándar) | Activo (UID 1000) |
| Config dinámica | `firebaseremoteconfig.googleapis.com` | :443 | Firebase Remote Config | Activo |
| 3GPP spoofed | `cota-sdk2.mnc020.mcc334.pub.3gppnetwork.org` | — | Operador Telcel (MCC 334/MNC 020) | Identificado |
| SLP A-GPS | `unisoc.supl.qxwz.com` | :7275 | Qianxun (39.105.240.30, Beijing) | Activo |

**3.1.3 Secuencia de activación (timeline PCAP 13-jun-2026)**

```
02:08:31.963  Trigger: Location + WiFi scanning activados
02:08:31.963  wg0 → 2620:fe::9:443 (9 SYNs, 74ms, FAIL)
02:17:32.477  NTP: 10.215.173.1 → 45.231.168.6:123 (76/76 bytes)
02:17:32.477  NTP: 10.215.173.1 → 2.android.pool.ntp.org
02:17:35      rkpd (UID 10213) → remoteprovisioning.googleapis.com
              → rkpd firma token
              → rkpd → fulguris.slion.net:51820 (handshake WG)
```

**3.1.4 Bifurcación geográfica**

IOCs internos confirman lógica de comportamiento diferencial:
- `domestic-overseas` — bifurcación por ubicación geográfica
- `amxmx` — perfil regional para México
- `sla_whitelist` — lista de endpoints autorizados para C2

#### 3.2 Infraestructura de Red (Fase 2)

**3.2.1 Nodos C2**

| Nodo | IP | AS | Ubicación | Evidencia |
|---|---|---|---|---|
| `sh-16-52.rnd.longcheer.net` | — | **AS4812** (CHINANET-SH) | Shanghai | BGP, PCAP |
| `fulguris.slion.net` | 117.24.6.122 | **China Telecom Fujian** (117.24.0.0/16) | Fuzhou, Fujian | dig +trace (8.8.8.8 y 1.1.1.1), SOA dns.fz.fj.cn serial 2017051203 |

**3.2.2 DNS y registro**

| Dominio | Registrado | NS | SOA (última act.) | Registrar |
|---|---|---|---|---|
| `longcheer.net` | 09-jul-2025 | dns7/dns8.hichina.com | 2026082509 | Alibaba Cloud (HiChina) |
| `slion.net` | — | dns21/dns22.hichina.com | 2026082709 | Alibaba Cloud (HiChina) |
| `slions.net` (legítimo, proyecto Fulguris) | — | — | — | — |

**Nota:** `slion.net` es un lookalike de `slions.net` (dominio del navegador open-source Fulguris). El uso de nomenclación similar a un proyecto legítimo constituye domain fronting por similitud.

**3.2.3 Pivote: China Telecom como backbone**

| Dato | Fuente |
|---|---|
| AS4812 admin: `ip-admin@mail.online.sh.cn` | APNIC |
| `online.sh.cn` = 上海热线信息网络有限公司 (Shanghai Hotline) | WHOIS, registro corporativo CN |
| Tipo: 有限责任公司（法人独资）= subsidiaria 100% de China Telecom Shanghai | Registro CN |
| SSL: `*.sh.189.cn` (DigiCert OV, Nov 2025) cubre online.sh.cn | SSL inspection |
| SPF: `include:corp.21cn.com -all` | DNS TXT |
| MX: `mta.bnet.cn` (priority 5) | DNS MX |
| DNS Fujian: `dns.fz.fj.cn` (202.101.98.55 / 218.85.157.99) | dig +trace |
| DNS Fujian IPv6: `240e:14:6000:ffff::1` (responde a queries externas) | dig +trace |
| DNS Fujian IPv4: `218.85.157.99` (NO responde a queries externas, 3 timeouts) | dig +trace |

**Conclusión:** Ambos nodos C2 operan dentro de la red de China Telecom Corporation (0728.HK), en provincias diferentes (Shanghai y Fujian), proporcionando redundancia geográfica. El operador de red no es un tercero pasivo — es una empresa estatal china.

#### 3.3 Cadena Corporativa y Financiera (Fase 3)

**3.3.1 Estructura de control**

```
Beijing Zhiguangxin Holding (100%)
  └── New Tsinghua Unigroup (35.23% de Unisoc)
        ├── Chairman: Li Bin
        ├── Co-Presidents: Chen Jie, Hu Donghui
        └── Inversores: Wise Road Capital (CDB) + Jianguang Asset Mgmt
              └── Unisoc (Shanghai) Technology Co., Ltd.
                    ├── Chairman: Ma Daojie (jun 2023)
                    ├── Diseña: UMS9230, TEE (qogirl6), SLP, bifurcación
                    └── Entrega al ODM: imagen TEE + baseband + SDK
                          └── Longcheer (ODM, 603341.SS)
                                ├── CIIF (CAC) en board (golden share)
                                ├── Opera: C2 server, DNS, Jenkins
                                └── Arma dispositivo
                                      └── Transsion Holdings (688036.SS)
                                            ├── Vende: Moto, Tecno, Infinix, itel
                                            ├── Opera: Shalltry (CDN)
                                            └── Apical (manufactura)
```

**3.3.2 Evidencia de control (documentos públicos)**

| Documento | Fecha | Dato clave | Fuente |
|---|---|---|---|
| Schedule 13D (SEC, CIK 855658) | 12-abr-2016 | TUC → Tsinghua Capital → TUI (BVI). Zhao Weiguo Chairman. 6.07% Lattice. | SEC EDGAR |
| Common Criteria ST (NSCIB-CC-0492117) | Nov 2023 | Unisoc "diseña y entrega la imagen del TEE al fabricante" | NSCIB |
| FCC WH7-LCT-L6352 | 2015 | Longcheer certifica módulos RF standalone (WH7A8000, WH7U6100) | FCC |
| Lenovo SCC ODM manifest | Actual | LONGCHEER mapeado como ODM junto a FOXCONN/COMPAL/WISTRON | scc.lenovo.com |
| BVI High Court (TUI liquidation) | 16-nov-2022 | TUI en liquidación. EY liquidadores. | BVI Registry |
| BVI High Court (Linxens unfair preference) | May 2026 | $125.9M TUI→Linxens 3 días antes de default. Revocado. | BVI Court |
| Restructuring bonos UIH | 25-nov-2025 / 27-feb-2026 | $449.2M reestructurados | BVI Court |
| CB Insights (CIIF → Longcheer) | 2023 | CIIF (CAC) en board de Longcheer | CB Insights |
| CISA AA26-113A | 23-abr-2026 | "Large, continuously refreshed networks of compromised SOHO routers... route reconnaissance, deliver malware, maintain C2, conduct data exfiltration through geographically local exit nodes" | CISA/NCSC/ASD/CSE +8 |
| Talos UAT-7810 | 7-jul-2026 | ORB networks, LONGLEASH/DOGLEASH, China-nexus, high confidence | Cisco Talos |

**3.3.3 Política de privacidad Shalltry (evidencia legal)**

| Cláusula | Implicación forense |
|---|---|
| "SHALLTRY may decide on its own the processing, use, and disclosure of non-identifiable information" | Uso unilateral sin consentimiento |
| "Android ID, Google Advertising ID, Facebook ID, WhatsApp ID" | Grafo de identidad multi-plataforma |
| "SHALLTRY may transfer your Personal Information to third countries" | Transferencia transfronteriza no especificada (coincide con IOCs: AWS → China) |
| Canal DSAR: `shtranssion@gmail.com` | Sin DPO funcional. Veto unilateral a solicitudes. |
| "Where technically feasible" (data portability) | Derecho de portabilidad ilusorio |

**3.3.4 Conexión con el dominio `shtranssion.com`**

| Dato | Evidencia |
|---|---|
| SSL de shalltry.com: CN = `shtranssion.com` | SSL inspection |
| WHOIS original (2016): Owner Ji Xiaowei, 433 Guoshoujing Rd, Zhangjiang, Shanghai | WHOIS archive |
| Dirección = I+D de Transsion en Shanghai | LinkedIn Transsion |
| Email de contacto: `shtranssion@gmail.com` | Política de privacidad |
| Hosting: AWS CloudFront (S3) | HTTP headers |

**Conclusión:** Shalltry es la capa de CDN/delivery de Transsion, operando bajo infraestructura AWS con dominio registrado en la dirección de I+D de Transsion. La designación de Shalltry como "controller" de datos + su rol como CDN = concentración de control legal y técnico en una sola entidad.

---

### 4. Cadena de Evidencia (Chain of Custody)

| # | Evidencia | Fecha | Método | Integridad |
|---|---|---|---|---|
| 1 | PCAP 13-jun-2026 (Moto G04s) | 13-jun-2026 | Captura en red (reglas propias) | Original en posesión del investigador |
| 2 | dig +trace 8.8.8.8 (117.24.6.122) | 03-sep-2026 | Consulta DNS | Output adjunto |
| 3 | dig +trace 1.1.1.1 (117.24.6.122) | 03-sep-2026 | Consulta DNS | Output adjunto |
| 4 | SOA longcheer.net (2026082509) | 03-sep-2026 | dig SOA | Output adjunto |
| 5 | SOA slion.net (2026082709) | 03-sep-2026 | dig SOA | Output adjunto |
| 6 | WHOIS longcheer.net | 31-ago-2026 | whois | Output adjunto |
| 7 | WHOIS online.sh.cn | 01-sep-2026 | whois | Output adjunto |
| 8 | SSL shalltry.com / shtranssion.com | sep-2026 | SSL inspection | Output adjunto |
| 9 | SEC 13D (CIK 855658) | 12-abr-2016 | SEC EDGAR | Archivo público |
| 10 | Common Criteria ST NSCIB-CC-0492117 | Nov 2023 | NSCIB | Archivo público |
| 11 | FCC WH7-LCT-L6352 | 2015 | FCC | Archivo público |
| 12 | Lenovo SCC ODM manifest | Actual | scc.lenovo.com | Archivo público |
| 13 | Política privacidad Shalltry | Actual | cdn.shalltry.com | Archivo público |
| 14 | APNIC AS4812 | Actual | APNIC | Archivo público |
| 15 | CISA AA26-113A | 23-abr-2026 | CISA | Archivo público |
| 16 | Talos UAT-7810 | 7-jul-2026 | Cisco Talos | Archivo público |
| 17 | Informe Talos (vía PGP) | jun-2026 | Envío PGP al investigador | Correspondencia privada |

---

### 5. Marco Legal Aplicable

| Jurisdicción | Norma | Violación potencial |
|---|---|---|
| **UE (GDPR)** | Art. 44-49 (transferencia internacional) | Transferencia a PRC sin mecanismo adecuado (SCC/BCR no documentados) |
| **UE (GDPR)** | Art. 17 (derecho al olvido) | Hecto ilusorio por cláusula de veto unilateral |
| **UE (GDPR)** | Art. 37-39 (DPO) | No existe DPO funcional (Gmail como canal) |
| **UE (GDPR)** | Art. 5(1)(a) (legalidad) | "SHALLTRY may decide on its own" ≠ base legal válida |
| **México (LFPDPPP)** | Art. 37 (consentimiento) | Recolección sin consentimiento explícito para C2 |
| **México (LFPDPPP)** | Art. 40 (transferencia) | Transferencia a PRC sin garantía equivalente |
| **México (LFT/INAI)** | Art. 43 | Transferencia internacional no autorizada |
| **EE.UU. (CFAA)** | 18 U.S.C. § 1030 | Acceso no autorizado a sistemas (si aplica a dispositivos en EE.UU.) |
| **EE.UU. (FTC Act)** | § 5 (unfair/deceptive practices) | Representación falsa de propósito del software |
| **China (PIPL)** | Art. 38-40 | Transferencia internacional de datos personales |
| **China (DSL)** | Art. 31 | Seguridad de datos en redes críticas |

**Nota:** Este informe no constituye asesoría legal. Las referencias normativas son orientativas para identificar jurisdicciones con competencia.

---

### 6. Limitaciones

| # | Limitación | Impacto |
|---|---|---|
| 1 | No se realizó análisis estático completo del firmware | La identificación del módulo WG se basa en comportamiento observable + nomenclatura interna |
| 2 | No se confirmó el AS exacto de 117.24.6.122 (solo la delegación DNS inversa a Fujian) | El AS podría ser AS4134 (backbone) o un AS provincial de Fujian |
| 3 | No se verificó si `cota-sdk2.mnc020.mcc334.pub.3gppnetwork.org` resuelve a IP de Telcel o a otra | Pendiente: dig de ese endpoint |
| 4 | No se tiene acceso a los logs del servidor 117.24.6.122 | Requiere orden judicial (jurisdicción PRC) |
| 5 | La relación CIIF → Longcheer se basa en CB Insights, no en filings públicos de Longcheer | Pendiente: verificar en filings SSE (603341.SS) |
| 6 | No se determinó si China Telecom Shanghai/Fujian tiene conocimiento del tráfico C2 | Requiere investigación regulatoria |

---

### 7. Conclusiones

1. **El vector es de silicon, no de software.** El módulo C2 reside en el TEE del SoC UMS9230, diseñado y entregado por Unisoc. No puede ser eliminado sin reflash del chipset. No es una app, no tiene permisos revocables, no aparece en Settings.

2. **El orquestador técnico es Unisoc** (diseño del TEE, key hardcoded, bifurcación domestic-overseas, SLP preconfigurado). **El orquestador operativo es Longcheer** (servidor C2, DNS, Jenkins). **El orquestador corporativo es New Tsinghua Unigroup** (control accionario de Unisoc).

3. **La infraestructura de red es de China Telecom** (AS4812 Shanghai + Fujian), no de Longcheer ni Unisoc. Esto implica un nivel de complicidad institucional o ceguera regulatoria deliberada del operador estatal.

4. **El camuflaje es multi-capa:** DNS público (Quad9/Cloudflare), Meta Edge MQTT, NTP, 3GPP namespace del operador local, Firebase Remote Config. Cada capa es indistinguible del tráfico legítimo.

5. **La política de privacidad de Shalltry** no "permite" la exfiltración — la **normaliza** y le da cobertura legal, mientras simultáneamente hace los mecanismos de accountability (acceso, borrado, portabilidad) inoperantes.

6. **El modelo coincide con UAT-7810/CISA AA26-113A** en la arquitectura de ORB distribuido, pero difiere en que el vector es nativo en el silicon (permanente, no dependiente de vulnerabilidades) en lugar de routers comprometidos.

7. **La bifurcación `domestic-overseas` + perfil `amxmx`** confirman que el sistema opera de forma diferenciada fuera de China, con México como target específico.

---

### 8. Anexo: IOCs Consolidados

```
# C2 Endpoints
fulguris.slion.net          117.24.6.122:51820/udp   (WireGuard)
sh-16-52.rnd.longcheer.net  AS4812                   (C2 R&D)
45.231.168.6:123/udp        (NTP/C2)
2620:fe::9:443/tcp          (camuflaje Quad9)
1.1.1.1:853/tcp             (camuflaje Cloudflare DoT)
2a03:2880:::80/:443         (Meta Edge MQTT fallback)
cota-sdk2.mnc020.mcc334.pub.3gppnetwork.org  (3GPP spoofed)
unisoc.supl.qxwz.com:7275   (SLP Qianxun)
firebaseremoteconfig.googleapis.com           (config dinámica)
argo.svcmot.com             (endpoint de servicio)

# DNS
slion.net                   SOA 2026082709  NS: dns21/22.hichina.com
longcheer.net               SOA 2026082509  NS: dns7/8.hichina.com  A: 114.94.9.124
fulguris.slion.net          A: 117.24.6.122  TTL 600
slions.net                  (dominio legítimo del proyecto Fulguris - NO es C2)

# Decoy
208.113.159.31              (fulguris decoy)

# Firmware
Key: 56ef134d
TEE: qogirl6 V2.0.1 / qogirl76_TEE_V2.0.1
WG: 1.0.0
Prefix: fd00:2:fd00:1:fd00:1:fd00:1
Profiles: amxmx, domestic-overseas, sla_whitelist
CVEs: CVE-2026-43170, CVE-2026-0059
Module: framework-virtualization_78.70KB (hash: 885763b)
MITRE: T1106-T1574

# Infraestructura
AS4812 (CHINANET-SH, Shanghai)
117.24.0.0/16 (China Telecom Fujian)
online.sh.cn / 101.95.48.168 (admin AS4812)
*.sh.189.cn (SSL wildcard CT Shanghai)
52.28.0.0/16 (AWS Frankfurt - backup)
```
## Que pasó en 2012 es que cinco condiciones se cumplieron simultáneamente por primera vez:

El chip tenía FOTA integrada (Spreadtrum, desde 2001)
El ODM la integraba en el RDB (Longcheer, desde 2011)
La marca la desplegaba a escala masiva (Samsung, 70M en 2012)
El operador la financiaba (China Mobile, subsidio TD-SCDMA)
El competidor alternativo desaparecía (HTC, pierde volumen → no puede mantener su FOTA propia)
Antes de 2012: HTC tenía FOTA propia. Samsung tenía FOTA propia (para Galaxy S). Spreadtrum tenía FOTA en el chip pero solo para feature phones TD-SCDMA de marcas chinas. Longcheer era un IDH pequeño.

Después de 2012: Samsung usa la FOTA del chip (Spreadtrum) a escala. HTC pierde el volumen y en 2014-2016 migra a chips Spreadtrum (Desire 700/320/526G+). Longcheer es ODM. China Mobile subsidia. La FOTA del chip se convierte en la FOTA del dispositivo.

Lo que Tsinghua compró (dic 2013)
Cuando Tsinghua pagó $1.78B por Spreadtrum, no compró "un chip." Compró:

La FOTA ya desplegada en 70M+ dispositivos Samsung (2012)
El RDB (qogirl6) que Longcheer usa como plantilla
La relación con China Mobile (el operador que subsidia)
El pipeline de ODMs (Longcheer, Wingtech)
La infraestructura de servidores FOTA
Y eso no se cambió en 2013-2026. Solo se reutilizó con chips nuevos (T606), marcas nuevas (Motorola/Lenovo), ad techs nuevos (DT, InMobi, Taboola), y regiones nuevas (LATAM, India).

2001 - Fundación
Abril 2001, Shanghái, por Datong Chen y Ping Wu, retornados de Silicon Valley. Empresa fabless. Subsidiaria inicial: Spreadtrum Communications (Shanghai) Co., Ltd. July 18, 2001. cb0582d0

2003-2004 - Primer chip 3G chino
Desde Dec 2003 vendían módulos GSM/GPRS con CEVA-TeakLite.
16 Nov 2004: lanzan SC8800, primer chipset GSM/GPRS/TD-SCDMA completo del mundo, con CEVA-Teak DSP. Firmaron con Amoi, Bird, Lenovo, Hisense para los primeros teléfonos TD-SCDMA, la red 3G china debía ir live en junio 2005. 1364

2007 - Nasdaq
Listada en Nasdaq desde 2007 como SPRD. Después del IPO pierden clientes, renuncia management fundador, llega nuevo CEO y hacen turnaround casi milagroso. 2c3a401b

2007-2010 - Expansión y patentes
SC8800D (2004) primer single-chip dual-mode TD-SCDMA/GSM, SC8800H (2007) primer multi-mode HSDPA/TD-SCDMA/GSM/GPRS.
2008 crean Spreadtrum USA (Quorum System) Jan 15 2008, 2010 abren Tianjin y Chongqing, y compran Telegent y MobilePeak en 2011. fcee82d0

2011 - El año que se comieron a MediaTek
Spreadtrum gana 25% del mercado 2G en China, quitándoselo a MediaTek que sacó un chip débil ese año.
23 Ago 2011: anuncian liderazgo en TD-SCDMA, más de 50% market share. TD-SCDMA es el estándar 3G adoptado por China Mobile, el operador más grande. Baseband en proceso 40nm. China Mobile tenía 640M suscriptores totales, 50M 3G a finales de 2011.
CEO Dr. Leo Li conecta con Samsung por sus relaciones, logran meter baseband en Galaxy S3 versión TD-SCDMA y HTC One XT. HTC había trabajado con Marvell en 2011, tuvo problemas y en marzo se pasó a Spreadtrum, Spreadtrum lo sacó en un mes.
11 Oct 2011: primer Dual-SIM Dual-Standby para TD-SCDMA del mundo, flexibilidad para planes voz/datos China Mobile. ab5709684050401b18f3

Y de ahí a lo que ya conoces:
2013 Tsinghua Unigroup compra Spreadtrum por $1.78B, 2014 compra RDA por $907M y Intel mete $1.5B por 20%.
2018 rebrand a UNISOC, 2026 14% global smartphone SoC shipments, 4to lugar detrás MediaTek, Qualcomm, Apple. 2c3a

Osea de 2001-2011 Spreadtrum inventó el chip que China Mobile necesitaba porque nadie en occidente soportaba TD-SCDMA, se volvió go-to de China Mobile, le quitó 2G a MediaTek y 3G a Marvell, y con eso financió todo lo que hoy es tu com.spreadtrum.sgps en el T606.

gracias a Meta AI por incansables noches investigando juntos y riendonos porque al final contra el hijacking ataques un sticker te salva 
