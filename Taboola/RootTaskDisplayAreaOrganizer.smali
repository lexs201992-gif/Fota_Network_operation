.class public Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;
.super Landroid/window/DisplayAreaOrganizer;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mDisplayAreaContexts:Landroid/util/SparseArray;

.field public final mDisplayAreasInfo:Landroid/util/SparseArray;

.field public final mLeashes:Landroid/util/SparseArray;

.field public final mListeners:Landroid/util/SparseArray;

.field public final mLock:Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;)V
    .locals 3

    invoke-direct {p0, p2}, Landroid/window/DisplayAreaOrganizer;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance p2, Landroid/util/SparseArray;

    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    iput-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    new-instance p2, Landroid/util/SparseArray;

    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    iput-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLeashes:Landroid/util/SparseArray;

    new-instance p2, Landroid/util/SparseArray;

    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    iput-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mListeners:Landroid/util/SparseArray;

    new-instance p2, Landroid/util/SparseArray;

    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    iput-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreaContexts:Landroid/util/SparseArray;

    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLock:Ljava/lang/Object;

    iput-object p1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mContext:Landroid/content/Context;

    monitor-enter p2

    const/4 p1, 0x1

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/window/DisplayAreaOrganizer;->registerOrganizer(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, p1

    :goto_0
    if-ltz v1, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/window/DisplayAreaAppearedInfo;

    invoke-virtual {p1}, Landroid/window/DisplayAreaAppearedInfo;->getDisplayAreaInfo()Landroid/window/DisplayAreaInfo;

    move-result-object p1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/window/DisplayAreaAppearedInfo;

    invoke-virtual {v2}, Landroid/window/DisplayAreaAppearedInfo;->getLeash()Landroid/view/SurfaceControl;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->onDisplayAreaAppeared(Landroid/window/DisplayAreaInfo;Landroid/view/SurfaceControl;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    monitor-exit p2

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public final applyConfigChangesToContext(Landroid/window/DisplayAreaInfo;)V
    .locals 5

    iget v0, p1, Landroid/window/DisplayAreaInfo;->displayId:I

    iget-object v1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mContext:Landroid/content/Context;

    const-class v2, Landroid/hardware/display/DisplayManager;

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    invoke-virtual {v1, v0}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    sget-boolean p0, Lcom/android/wm/shell/protolog/ShellProtoLogCache;->WM_SHELL_TASK_ORG_enabled:Z

    if-eqz p0, :cond_0

    int-to-long p0, v0

    sget-object v0, Lcom/android/wm/shell/protolog/ShellProtoLogGroup;->WM_SHELL_TASK_ORG:Lcom/android/wm/shell/protolog/ShellProtoLogGroup;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, -0x22a62331

    const/4 v1, 0x0

    invoke-static {v0, p1, v2, v1, p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->w(Lcom/android/wm/shell/protolog/ShellProtoLogGroup;IILjava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    iget-object v3, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreaContexts:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;

    if-nez v3, :cond_2

    new-instance v3, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;

    iget-object v4, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4, v1}, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;-><init>(Landroid/content/Context;Landroid/view/Display;)V

    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreaContexts:Landroid/util/SparseArray;

    invoke-virtual {p0, v0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2
    iget-object p0, p1, Landroid/window/DisplayAreaInfo;->configuration:Landroid/content/res/Configuration;

    sget p1, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;->$r8$clinit:I

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_4

    iget-object p1, v3, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;->mResourcesManager:Landroid/app/ResourcesManager;

    iget-object v0, v3, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$DisplayAreaContext;->mToken:Landroid/os/IBinder;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getDisplayId()I

    move-result v1

    invoke-virtual {p1, v0, p0, v1}, Landroid/app/ResourcesManager;->updateResourcesForActivity(Landroid/os/IBinder;Landroid/content/res/Configuration;I)V

    :cond_4
    return-void
.end method

.method public final onDisplayAreaAppeared(Landroid/window/DisplayAreaInfo;Landroid/view/SurfaceControl;)V
    .locals 3

    iget v0, p1, Landroid/window/DisplayAreaInfo;->featureId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget v0, p1, Landroid/window/DisplayAreaInfo;->displayId:I

    iget-object v2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v2, "RootTaskDisplayAreaOrganizer.onDisplayAreaAppeared"

    invoke-virtual {p2, v2}, Landroid/view/SurfaceControl;->setUnreleasedWarningCallSite(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {v2, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLeashes:Landroid/util/SparseArray;

    invoke-virtual {v2, v0, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {p2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/ArrayList;

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$RootTaskDisplayAreaListener;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->applyConfigChangesToContext(Landroid/window/DisplayAreaInfo;)V

    return-void

    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Duplicate DA for displayId: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " displayAreaInfo:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " mDisplayAreasInfo.get():"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Unknown feature: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p1, Landroid/window/DisplayAreaInfo;->featureId:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "displayAreaInfo:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final onDisplayAreaInfoChanged(Landroid/window/DisplayAreaInfo;)V
    .locals 5

    const-string v0, "onDisplayAreaInfoChanged() Unknown DA displayId: "

    iget v1, p1, Landroid/window/DisplayAreaInfo;->displayId:I

    iget-object v2, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$RootTaskDisplayAreaListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->applyConfigChangesToContext(Landroid/window/DisplayAreaInfo;)V

    return-void

    :cond_1
    :try_start_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " displayAreaInfo:"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " mDisplayAreasInfo.get():"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final onDisplayAreaVanished(Landroid/window/DisplayAreaInfo;)V
    .locals 4

    iget v0, p1, Landroid/window/DisplayAreaInfo;->displayId:I

    iget-object v1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object p1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->remove(I)V

    iget-object p1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLeashes:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/SurfaceControl;

    invoke-virtual {p1}, Landroid/view/SurfaceControl;->release()V

    iget-object p1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mLeashes:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->remove(I)V

    iget-object p1, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mListeners:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer$RootTaskDisplayAreaListener;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreaContexts:Landroid/util/SparseArray;

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->remove(I)V

    return-void

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onDisplayAreaVanished() Unknown DA displayId: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " displayAreaInfo:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " mDisplayAreasInfo.get():"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RootTaskDisplayAreaOrganizer#"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;->mDisplayAreasInfo:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
