.class public Lcom/longcheer/sidebar/ui/App;
.super Landroid/app/Application;
.source "App.java"


# static fields
.field private static app:Landroid/app/Application;

.field private static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getAppContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/longcheer/sidebar/ui/App;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    sput-object p0, Lcom/longcheer/sidebar/ui/App;->app:Landroid/app/Application;

    invoke-virtual {p0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lcom/longcheer/sidebar/ui/App;->mContext:Landroid/content/Context;

    return-void
.end method
