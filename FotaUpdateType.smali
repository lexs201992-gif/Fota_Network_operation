.class public abstract Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;
.super Ljava/lang/Object;
.source "FotaUpdateType.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getCriticalPackageInstallInterval()J
    .locals 2

    const-wide/16 v0, 0xa

    return-wide v0
.end method

.method getPriorityPackageInstallInterval()J
    .locals 2

    const-wide/16 v0, 0x3840

    return-wide v0
.end method

.method getPriorityPackageMaxInstallPostpnes()I
    .locals 0

    const/4 p0, 0x3

    return p0
.end method

.method isDownloadVisible()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
