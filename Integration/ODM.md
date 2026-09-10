ODM longcheer 
UDP6] fd00:2:fd00:1:fd00:1:fd00:1: ULA network Wg0

Jenkins (corre EN sh-XX.rnd.longcheer.net)]
  │  Workspace: /data/jenkins/workspace/Build-LXF_M173_U_MP_SMR_user/
  │  Compila firmware → firma con CA Longcheer → empaqueta OTA
  │
  ▼
[CDN / OTA server (separado del build host)]
  │
  ▼
[Dispositivo descarga OTA → instala → ro.product.build.host = "sh-XX.rnd"] 

[VM Linux (Toybox)]
  │  apt update / WG config / exfiltración
  │
  ▼
[vsock → host]
  │
  ▼
[wg0 en el host (UDP:51820)]
  │  O: TAP bridge (tun/tap driver 1.6 en kmsg)
  │
  ▼
[Red física del dispositivo (WiFi/cellular)]
  │
  ▼
[AWS (52.36.x.x, 13.224.x.x) / Azure (20.x.x.x)]   
