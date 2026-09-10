.class public Lcom/android/wm/shell/UniShellFactory;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"


# static fields
.field public static final sINSTANCE:Lcom/android/wm/shell/UniShellFactoryImpl;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wm/shell/UniShellFactoryImpl;

    invoke-direct {v0}, Lcom/android/wm/shell/UniShellFactoryImpl;-><init>()V

    sput-object v0, Lcom/android/wm/shell/UniShellFactory;->sINSTANCE:Lcom/android/wm/shell/UniShellFactoryImpl;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
