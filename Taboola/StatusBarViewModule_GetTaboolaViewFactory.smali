.class public abstract Lcom/android/systemui/statusbar/phone/dagger/StatusBarViewModule_GetTaboolaViewFactory;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Ljavax/inject/Provider;


# direct methods
.method public static getTaboolaView(Lcom/android/systemui/shade/NotificationShadeWindowView;)Lcom/android/keyguard/taboola/TaboolaView;
    .locals 1

    const v0, 0x7f0a0748

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/android/keyguard/taboola/TaboolaView;

    invoke-static {p0}, Ldagger/internal/Preconditions;->checkNotNullFromProvides(Ljava/lang/Object;)V

    return-object p0
.end method
