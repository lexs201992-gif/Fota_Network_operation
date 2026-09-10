.class public final Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;
.super Ljava/lang/Object;
.source "FotaUpdateTypes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$UserInitiatedFotaUpdate;,
        Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$NetworkInitiatedFotaUpdate;,
        Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$ClientInitiatedFotaUpdate;,
        Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;
    }
.end annotation


# static fields
.field private static me:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;


# instance fields
.field private final sources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;",
            "Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->sources:Ljava/util/Map;

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->DEVICE_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    new-instance v2, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$ClientInitiatedFotaUpdate;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$ClientInitiatedFotaUpdate;-><init>(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->USER_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    new-instance v2, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$UserInitiatedFotaUpdate;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$UserInitiatedFotaUpdate;-><init>(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;->NETWORK_INITIATED:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;

    new-instance v2, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$NetworkInitiatedFotaUpdate;

    invoke-direct {v2, p0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$NetworkInitiatedFotaUpdate;-><init>(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getInstance()Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;
    .locals 1

    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->me:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    if-nez v0, :cond_0

    new-instance v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    invoke-direct {v0}, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;-><init>()V

    sput-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->me:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    :cond_0
    sget-object v0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->me:Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;

    return-object v0
.end method


# virtual methods
.method public getUpgradeSource(Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes$Type;)Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;
    .locals 0

    iget-object p0, p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateTypes;->sources:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/motorola/ccc/ota/sources/fota/FotaUpdateType;

    return-object p0
.end method
