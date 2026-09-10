.class public abstract Lcom/android/systemui/media/dagger/MediaModule_ProvidesKeyguardMediaHostFactory;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Ljavax/inject/Provider;


# direct methods
.method public static providesKeyguardMediaHost(Lcom/android/systemui/media/controls/ui/MediaHost$MediaHostStateHolder;Lcom/android/systemui/media/controls/ui/MediaHierarchyManager;Lcom/android/systemui/media/controls/pipeline/MediaDataManager;Lcom/android/systemui/media/controls/ui/MediaHostStatesManager;)Lcom/android/systemui/media/controls/ui/MediaHost;
    .locals 1

    new-instance v0, Lcom/android/systemui/media/controls/ui/MediaHost;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/systemui/media/controls/ui/MediaHost;-><init>(Lcom/android/systemui/media/controls/ui/MediaHost$MediaHostStateHolder;Lcom/android/systemui/media/controls/ui/MediaHierarchyManager;Lcom/android/systemui/media/controls/pipeline/MediaDataManager;Lcom/android/systemui/media/controls/ui/MediaHostStatesManager;)V

    return-object v0
.end method
