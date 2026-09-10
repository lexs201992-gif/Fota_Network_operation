.class public final Lcom/motorola/ccc/ota/sources/BotaFotaResolver;
.super Ljava/lang/Object;
.source "BotaFotaResolver.java"


# instance fields
.field private _isBotaFirst:Z

.field private _isFotaEnabled:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isBotaFirst:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isFotaEnabled:Z

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->parseCheckOrder(Ljava/lang/String;)V

    return-void
.end method

.method private parseCheckOrder(Ljava/lang/String;)V
    .locals 5

    const-string v0, "fota"

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    return-void

    :cond_1
    const/4 v2, 0x0

    aget-object v3, v1, v2

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_2

    aget-object v3, v1, v4

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    iput-boolean v4, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isFotaEnabled:Z

    :cond_3
    aget-object v1, v1, v2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    iput-boolean v2, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isBotaFirst:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BotaFotaResolver.parse failed : for following check order ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "); assuming only bota is enabled"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public isBotaFirst()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isBotaFirst:Z

    return p0
.end method

.method public isFotaEnabled()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isFotaEnabled:Z

    return p0
.end method

.method public isFotaFirst()Z
    .locals 0

    iget-boolean p0, p0, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->_isBotaFirst:Z

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public resolveCheckForUpdateRepository()Lcom/motorola/ccc/ota/sources/UpgradeSourceType;
    .locals 1

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->isBotaFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/BotaFotaResolver;->isFotaEnabled()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object p0

    :cond_1
    sget-object p0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->upgrade:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    return-object p0
.end method
