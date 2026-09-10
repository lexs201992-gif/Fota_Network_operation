.class public Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;
.super Ljava/lang/Object;
.source "FotaDownloadHandler.java"

# interfaces
.implements Lcom/motorola/ccc/ota/sources/DownloadHandler;


# static fields
.field private static final KEY_WIFI_PROMPT_COUNT:Ljava/lang/String; = "com.motorola.ccc.ota.wifi_prompt_count"

.field private static final KEY_WIFI_PROMPT_DEFER_COUNT:I = 0x8


# instance fields
.field private c:Landroid/content/Context;

.field private final cm:Landroid/net/ConnectivityManager;

.field private final env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

.field private mEditor:Landroid/content/SharedPreferences$Editor;

.field private pref:Landroid/content/SharedPreferences;

.field private progress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final sm:Lcom/motorola/ccc/ota/CusSM;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/env/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->c:Landroid/content/Context;

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private downloadDirectly(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;)V
    .locals 10

    const-string v0, "OtaApp"

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v2}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    :try_start_0
    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v3, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "yes"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->cancelDownloadNotification()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0, v1, v2, v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendWifiDiscoverTimerExpiry(JI)V

    return-void

    :cond_0
    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v3

    iget-object v5, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->c:Landroid/content/Context;

    invoke-static {v5}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isBatteryLowToStartDownload(Landroid/content/Context;)Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, "showDownloadProgress"

    if-eqz v5, :cond_2

    :try_start_1
    const-string v1, "FotaDownloadHandler.sending suspended intent to UI due to low battery"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->BATTERY_LOW:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v1, v2, v4}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/ccc/ota/common/settings/Setting;Z)V

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->showDownloadProgress()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {v3, v6, v4}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V

    :cond_1
    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Ljava/io/File;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v9

    invoke-interface/range {v2 .. v9}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V

    return-void

    :cond_2
    iget-object v5, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sendDownloadStartIntent(J)V

    return-void

    :cond_3
    invoke-virtual {v3}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->isWifiOnly()Z

    move-result v5

    if-nez v5, :cond_4

    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sendDownloadStartIntent(J)V

    return-void

    :cond_4
    iget-object v5, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->cm:Landroid/net/ConnectivityManager;

    invoke-static {v5}, Lcom/motorola/ccc/ota/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v5

    const/4 v7, 0x0

    if-eqz v5, :cond_5

    invoke-direct {p0, v1, v2}, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sendDownloadStartIntent(J)V

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_PROMPT_COUNT_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, v1, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/ccc/ota/common/settings/Setting;I)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->cancelDownloadNotification()V

    goto :goto_0

    :cond_5
    iget-object v5, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v8, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_PROMPT_COUNT_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v8, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/ccc/ota/common/settings/Setting;I)I

    move-result v5

    const/16 v8, 0x8

    if-ge v5, v8, :cond_7

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->showDownloadProgress()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-static {v3, v6, v4}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V

    :cond_6
    const-string v1, "In FotaDownloadHandler.transferupgrade,sending suspended intent to UI"

    invoke-static {v0, v1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Ljava/io/File;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {p0}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p0

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getSize()J

    move-result-wide v6

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/motorola/ccc/ota/ui/UpdaterUtils;->isWifiOnly()Z

    move-result v9

    invoke-interface/range {v2 .. v9}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendUpdateDownloadStatusSuspended(Ljava/lang/String;JJLjava/lang/String;Z)V

    goto :goto_0

    :cond_7
    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p1

    invoke-interface {p1, v1, v2, v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendWifiDiscoverTimerExpiry(JI)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_PROMPT_COUNT_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p0, p1, v7}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setInt(Lcom/motorola/ccc/ota/common/settings/Setting;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FotaDownlaodHandler.downlaodDirectly failed: could not parse fota request id"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    :goto_0
    return-void
.end method

.method private sendDownloadStartIntent(J)V
    .locals 3

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->showDownloadProgress()Z

    move-result v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, p1, p2, v2, v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JIZ)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method public isBusy()Z
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0
.end method

.method public radioGotDown()V
    .locals 0

    return-void
.end method

.method public transferUpgrade(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;)V
    .locals 6

    new-instance v0, Lcom/motorola/ccc/ota/DownloadHelper;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getVersion()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v2}, Lcom/motorola/ccc/ota/utils/FileUtils;->getLocalPath(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getSize()J

    move-result-wide v3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/motorola/ccc/ota/DownloadHelper;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/DownloadHelper;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->progress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0, p1}, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;->downloadDirectly(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;)V

    return-void
.end method
