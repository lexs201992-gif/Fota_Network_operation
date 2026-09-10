.class public final Lcom/motorola/ccc/ota/env/AndroidFotaInterface;
.super Ljava/lang/Object;
.source "AndroidFotaInterface.java"


# static fields
.field public static final ACTION_CHECK_TIMER_EXPIRE:Ljava/lang/String; = "com.motorola.android.fota.ACITON_CHECK_TIMER_EXPIRE"

.field public static final ACTION_FOTA_BATTERY_CHANGED:Ljava/lang/String; = "com.motorola.android.fota.BATTERY_CHANGED"

.field public static final ACTION_FOTA_DEVICE_SETUP_COMPLETED:Ljava/lang/String; = "com.motorola.android.fota.SETUP_COMPLETED"

.field public static final ACTION_FOTA_DOWNLOAD_COMPLETE:Ljava/lang/String; = "com.motorola.android.fota.FOTA_DOWNLOAD_COMPLETE"

.field public static final ACTION_FOTA_DOWNLOAD_MODE_CHANGED:Ljava/lang/String; = "com.motorola.android.fota.FOTA_DOWNLOAD_MODE_CHANGED"

.field public static final ACTION_FOTA_INITIALIZATION:Ljava/lang/String; = "com.motorola.android.fota.FOTA_INITIALIZATION"

.field public static final ACTION_FOTA_POLICY_SET_CANCEL_ONGOING_UPDATE:Ljava/lang/String; = "com.motorola.android.fota.POLICY_SET_CANCEL_ONGOING_UPDATE"

.field public static final ACTION_FOTA_REQUEST_UPDATE:Ljava/lang/String; = "com.motorola.android.fota.FOTA_REQUEST_UPDATE"

.field public static final ACTION_FOTA_REQUEST_UPDATE_RESPONSE:Ljava/lang/String; = "com.motorola.android.fota.FOTA_REQUEST_UPDATE_RESPONSE"

.field public static final ACTION_FOTA_SERVER_TRANSPORT_MEDIA:Ljava/lang/String; = "com.motorola.android.fota.FOTA_SERVER_TRANSPORT_MEDIA"

.field public static final ACTION_FOTA_UPDATE_AVAILABLE:Ljava/lang/String; = "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE"

.field public static final ACTION_FOTA_UPDATE_AVAILABLE_RESPONSE:Ljava/lang/String; = "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE_RESPONSE"

.field public static final ACTION_FOTA_UPGRADE_RESULT:Ljava/lang/String; = "com.motorola.android.fota.FOTA_UPGRADE_RESULT"

.field public static final ACTION_FOTA_USER_ALERT_CELLULAR_OPT:Ljava/lang/String; = "com.motorola.android.fota.FOTA_USER_ALERT_CELLULAR_OPT"

.field public static final ACTION_FOTA_USER_AUTO_DOWNLOAD_SETTINGS:Ljava/lang/String; = "com.motorola.android.fota.USER_AUTO_DOWNLOAD_SETTINGS"

.field public static final ATTR_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final EXTRA_DL_PACKAGE_PATH:Ljava/lang/String; = "com.motorola.android.fotaInterface.DL_PACKAGE_PATH"

.field public static final EXTRA_DOWNLOAD_COMPLETE_ERROR:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_DOWNLOAD_COMPLETE_ERROR"

.field public static final EXTRA_ERROR:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_ERROR"

.field public static final EXTRA_IS_FORCED:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_IS_FORCED"

.field public static final EXTRA_IS_WIFI_ONLY:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.WIFI_ONLY_PACKAGE"

.field public static final EXTRA_REQUEST_ID:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_REQUEST_ID"

.field public static final EXTRA_SERVER_TRANSPORT_MEDIA:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.EXTRA_SERVER_TRANSPORT_MEDIA"

.field public static final EXTRA_SIZE:Ljava/lang/String; = "com.motoroal.android.fota.fotainterface.EXTRA_SIZE"

.field public static final EXTRA_UPDATE_AVAILABLE_RESPONSE_ERROR:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_AVAILABLE_RESPONSE_ERROR"

.field public static final EXTRA_UPDATE_TYPE:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_EXTRA_UPDATE_TYPE"

.field public static final EXTRA_UPGRADE_RESULT_ERROR:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.FOTA_UPGRADE_RESULT_ERROR"

.field public static final EXTRA_USER_SETTING_TRANSPORT_MEDIA:Ljava/lang/String; = "com.motorola.android.fota.fotainterface.EXTRA_USER_SETTING_TRANSPORT_MEDIA"

.field public static final EXTRA_WAS_MEMORY_LOW:Ljava/lang/String; = "com.motoroal.android.fota.fotainterface.EXTRA_WAS_MEMORY_LOW"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDDDescriptionFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    const-string v0, "description"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getErrorFromIntent(Landroid/content/Intent;)I
    .locals 2

    const-string v0, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_ERROR"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getIdFromIntent(Landroid/content/Intent;)J
    .locals 3

    const-string v0, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_REQUEST_ID"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getIntent(Ljava/lang/String;JI)Landroid/content/Intent;
    .locals 1

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p0, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_REQUEST_ID"

    invoke-virtual {v0, p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p0, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_ERROR"

    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object v0
.end method

.method public static getIsForcedFromIntent(Landroid/content/Intent;)Z
    .locals 2

    const-string v0, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_IS_FORCED"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static getPropertiesFrom(Landroid/content/Intent;)Ljava/util/Properties;
    .locals 4

    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_ERROR"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "com.motorola.android.fota.fotainterface.FOTA_EXTRA_REQUEST_ID"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static getSizeFromIntent(Landroid/content/Intent;)J
    .locals 3

    const-string v0, "com.motoroal.android.fota.fotainterface.EXTRA_SIZE"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static registerFotaInterfaceClient(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.android.fota.FOTA_REQUEST_UPDATE_RESPONSE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota.FOTA_DOWNLOAD_COMPLETE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method

.method public static registerFotaInterfaceServer(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.motorola.android.fota.FOTA_REQUEST_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE_RESPONSE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota.FOTA_UPGRADE_RESULT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const/4 v1, 0x2

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method

.method public static sendAutoDownloadSettingsToFota(Landroid/content/Context;Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.USER_AUTO_DOWNLOAD_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/motorola/ccc/ota/sources/fota/FotaConstants$AutoDownloadOption;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "com.motorola.android.fota.fotainterface.EXTRA_USER_SETTING_TRANSPORT_MEDIA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "com.motorola.android.fota"

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendBatteryChangedIntentToFota(Landroid/content/Context;Z)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "BatteryLow"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "com.motorola.android.fota"

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendDownloadComplete(Landroid/content/Context;JI)V
    .locals 1

    const-string v0, "com.motorola.android.fota.FOTA_DOWNLOAD_COMPLETE"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static sendFotaInitializationIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.FOTA_INITIALIZATION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendOngoingFotaPolicySetCancelIntent(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.POLICY_SET_CANCEL_ONGOING_UPDATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendRequestUpdate(Landroid/content/Context;J)V
    .locals 2

    const-string v0, "com.motorola.android.fota.FOTA_REQUEST_UPDATE"

    const/4 v1, -0x1

    invoke-static {v0, p1, p2, v1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.android.fota"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendRequestUpdateResponse(Landroid/content/Context;JI)V
    .locals 1

    const-string v0, "com.motorola.android.fota.FOTA_REQUEST_UPDATE_RESPONSE"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static sendSetupIntentToFota(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.motorola.android.fota.SETUP_COMPLETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.motorola.android.fota"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendUpdateAvailable(Landroid/content/Context;JJ[Ljava/util/Properties;)V
    .locals 3

    const-string v0, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE"

    const/4 v1, -0x1

    invoke-static {v0, p1, p2, v1}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motoroal.android.fota.fotainterface.EXTRA_SIZE"

    invoke-virtual {p1, p2, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    if-eqz p5, :cond_1

    array-length p2, p5

    const/4 p3, 0x0

    :goto_0
    if-ge p3, p2, :cond_1

    aget-object p4, p5, p3

    invoke-virtual {p4}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p4, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static sendUpdateAvailableResponse(Landroid/content/Context;JI)V
    .locals 1

    const-string v0, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE_RESPONSE"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.android.fota"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendUpdateAvailableResponse(Landroid/content/Context;JIZ)V
    .locals 1

    const-string v0, "com.motorola.android.fota.FOTA_UPDATE_AVAILABLE_RESPONSE"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.android.fota"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.motoroal.android.fota.fotainterface.EXTRA_WAS_MEMORY_LOW"

    invoke-virtual {p1, p2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendUpgradeResult(Landroid/content/Context;JI)V
    .locals 1

    const-string v0, "com.motorola.android.fota.FOTA_UPGRADE_RESULT"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.android.fota"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public static sendWifiDiscoverTimerExpiry(Landroid/content/Context;JI)V
    .locals 1

    const-string v0, "com.motorola.android.fota.ACITON_CHECK_TIMER_EXPIRE"

    invoke-static {v0, p1, p2, p3}, Lcom/motorola/ccc/ota/env/AndroidFotaInterface;->getIntent(Ljava/lang/String;JI)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "com.motorola.android.fota"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method
