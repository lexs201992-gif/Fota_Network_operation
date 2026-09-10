.class public Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;
.super Lcom/motorola/ccc/ota/sources/UpgradeSource;
.source "FotaUpgradeSource.java"


# static fields
.field public static final FOTA_REQUEST_ID:I = 0x472

.field public static final REBOOT_NOTIFICATION_ANNOY_VALUE_MINS:J = 0xf0L


# instance fields
.field private final env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

.field private final settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

.field private final sm:Lcom/motorola/ccc/ota/CusSM;

.field private final updateTypes:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

.field private final versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;


# direct methods
.method public constructor <init>(Lcom/motorola/ccc/ota/CusSM;Lcom/motorola/ccc/ota/NewVersionHandler;Lcom/motorola/ccc/ota/env/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-direct {p0, v0}, Lcom/motorola/ccc/ota/sources/UpgradeSource;-><init>(Lcom/motorola/ccc/ota/sources/UpgradeSourceType;)V

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    iput-object p3, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    iput-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    iput-object p4, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->getInstance()Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    move-result-object p1

    iput-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->updateTypes:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    const-string p0, "OtaApp"

    const-string p1, "FotaUpgradeSource.FotaUpgradeSource object is constructed"

    invoke-static {p0, p1}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static fotaRequestUpdateResponse(JI)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FotaUpgradeSource.fotaRequestUpdateResponse ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "OtaApp"

    invoke-static {p1, p0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_OK:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    packed-switch p2, :pswitch_data_0

    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_FAIL:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_0
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_STORAGE_LOW:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_1
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_INTERNAL:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_2
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_ROAMING:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_3
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_NOTFOUND:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_4
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_ALREADY:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_5
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_ALREADY:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_6
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_NET:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_7
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_FAIL:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    goto :goto_0

    :pswitch_8
    sget-object p0, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_OK:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static handleUpdateStatus(Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V
    .locals 3

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isBotaATT()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    invoke-virtual {p0}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/16 v1, 0x199

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FotaUpgradeSource.handleUpdateStatus: unknown status "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "OtaApp"

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x197

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x1f3

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x194

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_3
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x1f6

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_4
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x1f5

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_5
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_6
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x192

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_7
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0xc8

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    goto :goto_0

    :pswitch_8
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object p0

    const/16 v0, 0x191

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/utils/DmSendAlertService;->sendFotaDownloadAndUpdateAlert(Landroid/content/Context;I)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static sendFotaDownloadModeChanged(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.FOTA_DOWNLOAD_MODE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/motorola/ccc/ota/common/utils/BroadcastUtils;->sendLocalBroadcast(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private shutDownBotaPolling()V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->NEXT_POLLING_VALUE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/ccc/ota/common/settings/Setting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLL_AFTER:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setLong(Lcom/motorola/ccc/ota/common/settings/Setting;J)V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->POLLING_FEATURE:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/ccc/ota/common/settings/Setting;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendPollIntent()V

    return-void
.end method


# virtual methods
.method public checkForDownloadDescriptor(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v0

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DATA_SPACE_RETRY_COUNT:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getInt(Lcom/motorola/ccc/ota/common/settings/Setting;I)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    const-string v2, "showDownloadProgress"

    invoke-static {v0, v2, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v1

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V

    :cond_0
    invoke-virtual {v0}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->isWifiOnly()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "no"

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v0

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->startFotaWifiDiscoveryTimer()V

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v2, "yes"

    invoke-virtual {v0, v1, v2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendStartDownloadNotification(Ljava/lang/String;)V

    return-void
.end method

.method public checkForUpdate(ZIZ)V
    .locals 2

    const-string p1, "OtaApp"

    const-string v0, "sending check for update call against FOTA repository"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-static {v0}, Lcom/motorola/ccc/ota/common/utils/NetworkUtils;->isRoaming(Landroid/net/ConnectivityManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/motorola/ccc/ota/common/utils/NetworkUtils;->isWifi(Landroid/net/ConnectivityManager;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "FotaUpgradeSource.checkForUpdate, device is in roaming"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p0

    sget-object p1, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;->ERR_ROAMING:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;

    const/4 v0, 0x0

    invoke-interface {p0, p1, p2, p3, v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendActionUpdateResponse(Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$Error;IZLjava/lang/String;)V

    return-void

    :cond_0
    if-eqz p3, :cond_1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    int-to-long p1, p2

    invoke-interface {p0, p1, p2}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendRequestUpdate(J)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->shutDownBotaPolling()V

    :goto_0
    return-void
.end method

.method public doYouDownloadDirectly(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public downloadCompleted(JILjava/lang/String;)V
    .locals 18

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p4

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-static {v4}, Lcom/motorola/ccc/ota/stats/StatsHelper;->setDownloadEndTime(Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)V

    iget-object v4, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v5

    move/from16 v6, p3

    invoke-interface {v5, v1, v2, v6}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->getFotaDownloadCompleted(JI)Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$DownloadStatus;

    move-result-object v5

    sget-object v7, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$DownloadStatus;->STATUS_VERIFY:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$DownloadStatus;

    if-eq v5, v7, :cond_0

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    if-nez v7, :cond_1

    const/4 v11, 0x0

    goto :goto_1

    :cond_1
    const/4 v11, 0x2

    :goto_1
    iget-object v12, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v12, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v12

    iget-object v13, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v13}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v13

    invoke-interface {v13}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->cleanFotaWifiDiscoveryTimer()V

    const-string v13, "FotaUpgradeSource.downloadCompleted "

    const-string v14, "OtaApp"

    if-nez v7, :cond_3

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v10, " verifying "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v14, v10}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "/data"

    invoke-virtual {v3, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    iget-object v10, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v15, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PACKAGE_DOWNLOAD_PATH:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v9, "data"

    invoke-virtual {v10, v15, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    iget-object v9, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PACKAGE_DOWNLOAD_PATH:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v15, "cache"

    invoke-virtual {v9, v10, v15}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    :goto_2
    iget-object v9, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    iget-object v10, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    invoke-virtual {v0, v9, v3, v10}, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->verifyFile(Lcom/motorola/ccc/ota/env/ApplicationEnv;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;)Z

    move-result v9

    if-nez v9, :cond_3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " failed verifying "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, " Failure Reason : "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v10, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->UPGRADE_STATUS_VERIFY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v9, v10}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "."

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v14, v7}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v11, 0x4

    const/4 v7, 0x1

    :cond_3
    if-nez v7, :cond_4

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v10, " checking metadata "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v14, v10}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static/range {p4 .. p4}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->readMetaDataFromFile(Ljava/lang/String;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v10

    if-nez v10, :cond_5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v11, " could not read metadata "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v14, v3}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x1

    const/4 v11, 0x3

    goto :goto_3

    :cond_4
    const/4 v10, 0x0

    :cond_5
    :goto_3
    const-string v3, "FotaUpgradeSource.downloadCompleted failed: "

    if-nez v7, :cond_8

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getExtraSpaceCache()J

    move-result-wide v8

    move-object/from16 v16, v14

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->getCurrentUTC()J

    move-result-wide v13

    move/from16 v17, v7

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getSourceBuildTimeStamp()J

    move-result-wide v6

    invoke-super {v0, v13, v14, v6, v7}, Lcom/motorola/ccc/ota/sources/UpgradeSource;->isUpgradeAcceptable(JJ)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v13, v16

    invoke-static {v13, v7}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x1

    const/4 v11, 0x3

    goto :goto_4

    :cond_6
    move-object/from16 v13, v16

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->doesCachePartitionExist()Z

    move-result v7

    if-eqz v7, :cond_7

    iget-object v7, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v7}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v7

    invoke-interface {v7}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->clearCache()V

    iget-object v7, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-static {v7, v8, v9}, Lcom/motorola/ccc/ota/utils/FileUtils;->isSpaceAvailableInCache(Lcom/motorola/ccc/ota/env/ApplicationEnv;J)Z

    move-result v7

    if-nez v7, :cond_7

    const/4 v11, 0x5

    const/4 v7, 0x1

    goto :goto_4

    :cond_7
    move/from16 v7, v17

    goto :goto_4

    :cond_8
    move/from16 v17, v7

    move-object v13, v14

    const/4 v6, 0x0

    :goto_4
    if-eqz v7, :cond_b

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v3}, Lcom/motorola/ccc/ota/utils/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v3}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v3

    invoke-interface {v3, v1, v2, v11}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    if-nez v6, :cond_9

    const-string v6, "N/A"

    :cond_9
    const/4 v2, 0x2

    aput-object v6, v1, v2

    const-string v2, "fota download failed: (%s) %s %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->showDownloadProgress()Z

    move-result v2

    const-string v3, "FAILED_FOTA."

    if-eqz v2, :cond_a

    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0, v4, v5, v1, v3}, Lcom/motorola/ccc/ota/CusSM;->failDownload(Ljava/lang/String;Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$DownloadStatus;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_a
    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0, v4, v1, v3}, Lcom/motorola/ccc/ota/CusSM;->failDownloadInternalSilent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_5
    return-void

    :cond_b
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "version"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "otaTargetSha1"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getTargetSha1()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "extraSpace"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getExtraSpace()J

    move-result-wide v5

    invoke-virtual {v2, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "extraSpaceCache"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getExtraSpaceCache()J

    move-result-wide v5

    invoke-virtual {v2, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "displayVersion"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getDisplayVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "abMaxChunkSize"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getChunkSize()J

    move-result-wide v5

    invoke-virtual {v2, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "actualTargetBlurVersion"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getmActualTargetVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "abInstallType"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getAbInstallType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "USERDATA_REQUIRED_FOR_UPDATE"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getUserDataRequiredForUpdate()J

    move-result-wide v5

    invoke-virtual {v2, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "sourceBuildTimestamp"

    invoke-virtual {v10}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->getSourceBuildTimeStamp()J

    move-result-wide v5

    invoke-virtual {v2, v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-static {v12, v1}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Lorg/json/JSONObject;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v1

    iget-object v2, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v2, v1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    const-string v1, "FotaUpgradeSource.downloadCompleted: override metadata failed"

    invoke-static {v13, v1}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :goto_6
    iget-object v0, v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object v0

    sget-object v1, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v1}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v4, v1, v2}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->sendInternalNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public downloadModeChanged(JZ)V
    .locals 0

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->METADATA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->from(Ljava/lang/String;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p1

    const-string p2, "wifionly"

    invoke-static {p1, p2, p3}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p1

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {p2, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V

    const-string p1, "none"

    if-eqz p3, :cond_0

    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p1

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->startFotaWifiDiscoveryTimer()V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string p2, "no"

    invoke-virtual {p0, p1, p2}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object p3, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->WIFI_DISCOVERY_EXPIRED_FOR_FOTA:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {p2, p3, p1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getUtilities()Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Utilities;->cleanFotaWifiDiscoveryTimer()V

    :cond_1
    :goto_0
    return-void
.end method

.method public getDownloadHandler()Lcom/motorola/ccc/ota/sources/DownloadHandler;
    .locals 3

    new-instance v0, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;

    iget-object v1, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    iget-object v2, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-direct {v0, v1, v2, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaDownloadHandler;-><init>(Lcom/motorola/ccc/ota/env/ApplicationEnv;Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;Lcom/motorola/ccc/ota/CusSM;)V

    return-object v0
.end method

.method public handleUpdateStatus(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;)V
    .locals 5

    const-string v0, "OtaApp"

    invoke-static {}, Lcom/motorola/ccc/ota/utils/BuildPropReader;->isFotaATT()Z

    move-result v1

    if-eqz v1, :cond_0

    :try_start_0
    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    sget-object p1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$UpgradeStatusConstents:[I

    invoke-virtual {p2}, Lcom/motorola/ccc/ota/sources/UpgradeStatusConstents;->ordinal()I

    move-result v3

    aget p1, p1, v3

    const/4 v3, 0x1

    const/4 v4, 0x2

    packed-switch p1, :pswitch_data_0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "FotaUpgradeSource.handleUpdateStatus: unknown status "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    const/4 p1, 0x5

    invoke-interface {p0, v1, v2, p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_1
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    const/4 p1, 0x3

    invoke-interface {p0, v1, v2, p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JI)V

    goto :goto_0

    :pswitch_2
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_3
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0, v1, v2, v3}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_4
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    const/4 p1, 0x6

    invoke-interface {p0, v1, v2, p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_5
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, v1, v2, p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_6
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0, v1, v2, v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpgradeResult(JI)V

    goto :goto_0

    :pswitch_7
    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0, v1, v2, v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JI)V

    goto :goto_0

    :catch_0
    move-exception p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FotaUpgradeSource.handleUpdateStatus failed parsing fota request id "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getInfo()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public plugin_exit()V
    .locals 0

    return-void
.end method

.method public plugin_init(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;",
            ">;)V"
        }
    .end annotation

    const-string p1, "OtaApp"

    const-string v0, "FotaUpgradeSource.plugin_init: sending Fota Initialization intent"

    invoke-static {p1, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object p0

    invoke-interface {p0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendFotaInitializationIntent()V

    return-void
.end method

.method public setMemoryLowInfo(Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;)V
    .locals 2

    invoke-interface {p1}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getMeta()Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/dataobjects/MetaData;->showDownloadProgress()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    const-string v1, "showDownloadProgress"

    invoke-static {p1, v1, v0}, Lcom/motorola/ccc/ota/utils/MetadataOverrider;->returnOverWrittenMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Z)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object p1

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {p0, p1}, Lcom/motorola/ccc/ota/CusSM;->overWriteMetaData(Lcom/motorola/ccc/ota/dataobjects/MetaData;)V

    :cond_0
    return-void
.end method

.method public updateAvailable(JJLjava/lang/String;ZLjava/lang/String;Z)V
    .locals 20

    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    invoke-static/range {p7 .. p7}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->valueOf(Ljava/lang/String;)Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    move-result-object v0

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->updateTypes:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    invoke-virtual {v4, v0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->getUpgradeSource(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;)Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;->isDownloadVisible()Z

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "isDownloadVisible: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "OtaApp"

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v5}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;

    move-result-object v5

    invoke-interface {v5}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string v11, "metaVersion"

    invoke-virtual {v10, v11, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v11, "otaSourceSha1"

    invoke-virtual {v10, v11, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v11, "otaTargetSha1"

    const-string v12, "DUMMYSHA1"

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v11, "version"

    invoke-virtual {v10, v11, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v11, "minVersion"

    invoke-virtual {v10, v11, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v11, "forced"

    invoke-virtual {v10, v11, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "showPreDownloadDialog"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v11, "showDownloadProgress"

    invoke-virtual {v10, v11, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v4, "serviceControlEnabled"

    invoke-virtual {v10, v4, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v4, "severityType"

    sget-object v11, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$SeverityType;->CRITICAL:Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$SeverityType;

    invoke-virtual {v11}, Lcom/motorola/ccc/ota/utils/UpgradeUtilConstants$SeverityType;->ordinal()I

    move-result v11

    invoke-virtual {v10, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v4, "maxUpdateFailCount"

    const/4 v11, -0x1

    invoke-virtual {v10, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v4, 0x3

    const-string v13, "criticalUpdateDeferCount"

    const-string v14, "criticalUpdateReminder"

    if-eqz p6, :cond_0

    :try_start_2
    invoke-static {}, Lcom/motorola/ccc/ota/env/OtaApplication;->getGlobalContext()Landroid/content/Context;

    move-result-object v15

    invoke-static {v15}, Lcom/motorola/ccc/ota/utils/CusUtilMethods;->isItFirstNetOnFota(Landroid/content/Context;)Z

    move-result v15

    if-nez v15, :cond_0

    invoke-virtual {v10, v14, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v10, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    const/16 v15, 0xf0

    invoke-virtual {v10, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v10, v13, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :goto_0
    const-string v13, "criticalUpdateExtraWaitCount"

    invoke-virtual {v10, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v13, "criticalUpdateExtraWaitPeriod"

    invoke-virtual {v10, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object v13, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v14, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_RELEASE_NOTES:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v13, v14}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "%s"

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    if-eq v14, v11, :cond_1

    new-array v11, v9, [Ljava/lang/Object;

    aput-object v5, v11, v12

    invoke-static {v13, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "FotaUpgradeSource.updateAvailable release notes is : "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "releaseNotes"

    invoke-virtual {v10, v5, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "flavour"

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v13, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_FLAVOUR:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v11, v13}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "size"

    move-wide/from16 v13, p3

    invoke-virtual {v10, v5, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v5, "preInstallNotes"

    move-object/from16 v11, p5

    invoke-virtual {v10, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "preInstallNotificationExpiryMins"

    const-wide/16 v13, 0xf0

    invoke-virtual {v10, v5, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v5, "extraSpace"

    invoke-virtual {v10, v5, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v5, "wifionly"

    move/from16 v11, p8

    invoke-virtual {v10, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v5, "annoy"

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v12, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->DEFAULT_ANNOY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v11, v12}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v5, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "constructed fota metaData : "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v5, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v11, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v5, v11}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->getString(Lcom/motorola/ccc/ota/common/settings/Setting;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_5

    sget-object v5, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$sources$fota$FotaUpdateTypes$Type:[I

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->ordinal()I

    move-result v0

    aget v0, v5, v0

    if-eq v0, v9, :cond_4

    if-eq v0, v7, :cond_3

    if-eq v0, v4, :cond_2

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->notification:Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_3
    sget-object v0, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->polling:Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_4
    sget-object v0, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->user:Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/dataobjects/CheckForUpgradeTriggeredBy;->name()Ljava/lang/String;

    move-result-object v8

    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "triggered by "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v4, v8}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRACKINGID:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v5, "Fota"

    invoke-virtual {v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v4, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->PACKAGE_DOWNLOAD_PATH:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    const-string v5, "data"

    invoke-virtual {v0, v4, v5}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setString(Lcom/motorola/ccc/ota/common/settings/Setting;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v8, v10

    goto :goto_2

    :catch_1
    move-exception v0

    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception while constructing the metadata: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    move-object v10, v8

    :cond_5
    :goto_3
    invoke-static {v10}, Lcom/motorola/ccc/ota/dataobjects/builders/MetaDataBuilder;->from(Lorg/json/JSONObject;)Lcom/motorola/ccc/ota/dataobjects/MetaData;

    move-result-object v12

    iget-object v11, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->versionHanlder:Lcom/motorola/ccc/ota/NewVersionHandler;

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    const-wide/16 v16, 0x0

    const-string v15, "fota update initiated"

    const-string v18, "unknown"

    const-string v19, "unknown"

    invoke-interface/range {v11 .. v19}, Lcom/motorola/ccc/ota/NewVersionHandler;->handleNewVersion(Lcom/motorola/ccc/ota/dataobjects/MetaData;Ljava/lang/String;Lcom/motorola/ccc/ota/sources/UpgradeSourceType;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    move-result-object v0

    sget-object v4, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->NEW_VERSION_OK:Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;

    if-eq v0, v4, :cond_a

    sget-object v4, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource$1;->$SwitchMap$com$motorola$ccc$ota$NewVersionHandler$ReturnCode:[I

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/NewVersionHandler$ReturnCode;->ordinal()I

    move-result v0

    aget v0, v4, v0

    const/4 v4, 0x4

    if-eq v0, v9, :cond_7

    if-eq v0, v7, :cond_6

    goto :goto_4

    :cond_6
    const/4 v9, 0x5

    goto :goto_4

    :cond_7
    move v9, v4

    :goto_4
    if-ne v9, v4, :cond_9

    :try_start_3
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    iget-object v4, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;

    move-result-object v4

    invoke-interface {v4}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Services;->getDeviceSha1()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/motorola/ccc/ota/CusSM;->getDescription(Ljava/lang/String;)Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;

    move-result-object v0

    if-eqz v0, :cond_8

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv$Database$Descriptor;->getRepository()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->fota:Lcom/motorola/ccc/ota/sources/UpgradeSourceType;

    invoke-virtual {v4}, Lcom/motorola/ccc/ota/sources/UpgradeSourceType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "Suppressing duplicate fota update available notification"

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_8
    const-string v0, "Already working on BOTA or SDcard update"

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v0

    invoke-interface {v0, v2, v3, v9}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JI)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_5

    :catch_2
    move-exception v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FotaUpgradeSource.updateAvailable failed reading blurversion/cusdb "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/motorola/ccc/ota/utils/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v0

    invoke-interface {v0, v2, v3, v9}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JI)V

    goto :goto_5

    :cond_9
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->env:Lcom/motorola/ccc/ota/env/ApplicationEnv;

    invoke-interface {v0}, Lcom/motorola/ccc/ota/env/ApplicationEnv;->getFotaServices()Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;

    move-result-object v0

    invoke-interface {v0, v2, v3, v9}, Lcom/motorola/ccc/ota/env/ApplicationEnv$FotaServices;->sendUpdateAvailableResponse(JI)V

    :goto_5
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v1, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->TRIGGERED_BY:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v1}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->removeConfig(Lcom/motorola/ccc/ota/common/settings/Setting;)V

    return-void

    :cond_a
    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->settings:Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;

    sget-object v2, Lcom/motorola/ccc/ota/sources/bota/settings/Configs;->ALLOW_ON_ROAMING:Lcom/motorola/ccc/ota/sources/bota/settings/Configs;

    invoke-virtual {v0, v2, v9}, Lcom/motorola/ccc/ota/sources/bota/settings/BotaSettings;->setBoolean(Lcom/motorola/ccc/ota/common/settings/Setting;Z)V

    iget-object v0, v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpgradeSource;->sm:Lcom/motorola/ccc/ota/CusSM;

    invoke-virtual {v0}, Lcom/motorola/ccc/ota/CusSM;->pleaseRunStateMachine()V

    return-void
.end method
