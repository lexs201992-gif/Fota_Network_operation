.class public final Lcom/android/wm/shell/desktopmode/DesktopTasksController;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Lcom/android/wm/shell/common/RemoteCallable;
.implements Lcom/android/wm/shell/transition/Transitions$TransitionHandler;


# static fields
.field public static final DESKTOP_DENSITY_ALLOWED_RANGE:Lkotlin/ranges/IntRange;

.field public static final DESKTOP_DENSITY_OVERRIDE:I


# instance fields
.field public final context:Landroid/content/Context;

.field public final desktopMode:Lcom/android/wm/shell/desktopmode/DesktopTasksController$DesktopModeImpl;

.field public final desktopModeTaskRepository:Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;

.field public final displayController:Lcom/android/wm/shell/common/DisplayController;

.field public final enterDesktopTaskTransitionHandler:Lcom/android/wm/shell/desktopmode/EnterDesktopTaskTransitionHandler;

.field public final exitDesktopTaskTransitionHandler:Lcom/android/wm/shell/desktopmode/ExitDesktopTaskTransitionHandler;

.field public final mOnAnimationFinishedCallback:Lcom/android/wm/shell/desktopmode/DesktopTasksController$mOnAnimationFinishedCallback$1;

.field public final mainExecutor:Lcom/android/wm/shell/common/ShellExecutor;

.field public final rootTaskDisplayAreaOrganizer:Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;

.field public final shellController:Lcom/android/wm/shell/sysui/ShellController;

.field public final shellTaskOrganizer:Lcom/android/wm/shell/ShellTaskOrganizer;

.field public final syncQueue:Lcom/android/wm/shell/common/SyncTransactionQueue;

.field public final transitions:Lcom/android/wm/shell/transition/Transitions;

.field public visualIndicator:Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    const-string v0, "persist.wm.debug.desktop_mode_density"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_OVERRIDE:I

    new-instance v0, Lkotlin/ranges/IntRange;

    const/16 v1, 0x64

    const/16 v2, 0x3e8

    invoke-direct {v0, v1, v2}, Lkotlin/ranges/IntRange;-><init>(II)V

    sput-object v0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_ALLOWED_RANGE:Lkotlin/ranges/IntRange;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/wm/shell/sysui/ShellInit;Lcom/android/wm/shell/sysui/ShellController;Lcom/android/wm/shell/common/DisplayController;Lcom/android/wm/shell/ShellTaskOrganizer;Lcom/android/wm/shell/common/SyncTransactionQueue;Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;Lcom/android/wm/shell/transition/Transitions;Lcom/android/wm/shell/desktopmode/EnterDesktopTaskTransitionHandler;Lcom/android/wm/shell/desktopmode/ExitDesktopTaskTransitionHandler;Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;Lcom/android/wm/shell/common/ShellExecutor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->context:Landroid/content/Context;

    iput-object p3, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->shellController:Lcom/android/wm/shell/sysui/ShellController;

    iput-object p4, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->displayController:Lcom/android/wm/shell/common/DisplayController;

    iput-object p5, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->shellTaskOrganizer:Lcom/android/wm/shell/ShellTaskOrganizer;

    iput-object p6, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->syncQueue:Lcom/android/wm/shell/common/SyncTransactionQueue;

    iput-object p7, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->rootTaskDisplayAreaOrganizer:Lcom/android/wm/shell/RootTaskDisplayAreaOrganizer;

    iput-object p8, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->transitions:Lcom/android/wm/shell/transition/Transitions;

    iput-object p9, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->enterDesktopTaskTransitionHandler:Lcom/android/wm/shell/desktopmode/EnterDesktopTaskTransitionHandler;

    iput-object p10, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->exitDesktopTaskTransitionHandler:Lcom/android/wm/shell/desktopmode/ExitDesktopTaskTransitionHandler;

    iput-object p11, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->desktopModeTaskRepository:Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;

    iput-object p12, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->mainExecutor:Lcom/android/wm/shell/common/ShellExecutor;

    new-instance p1, Lcom/android/wm/shell/desktopmode/DesktopTasksController$mOnAnimationFinishedCallback$1;

    invoke-direct {p1, p0}, Lcom/android/wm/shell/desktopmode/DesktopTasksController$mOnAnimationFinishedCallback$1;-><init>(Lcom/android/wm/shell/desktopmode/DesktopTasksController;)V

    iput-object p1, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->mOnAnimationFinishedCallback:Lcom/android/wm/shell/desktopmode/DesktopTasksController$mOnAnimationFinishedCallback$1;

    new-instance p1, Lcom/android/wm/shell/desktopmode/DesktopTasksController$DesktopModeImpl;

    invoke-direct {p1, p0}, Lcom/android/wm/shell/desktopmode/DesktopTasksController$DesktopModeImpl;-><init>(Lcom/android/wm/shell/desktopmode/DesktopTasksController;)V

    iput-object p1, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->desktopMode:Lcom/android/wm/shell/desktopmode/DesktopTasksController$DesktopModeImpl;

    sget-boolean p1, Lcom/android/wm/shell/desktopmode/DesktopModeStatus;->IS_PROTO2_ENABLED:Z

    if-eqz p1, :cond_0

    new-instance p1, Lcom/android/wm/shell/desktopmode/DesktopTasksController$1;

    invoke-direct {p1, p0}, Lcom/android/wm/shell/desktopmode/DesktopTasksController$1;-><init>(Lcom/android/wm/shell/desktopmode/DesktopTasksController;)V

    invoke-virtual {p2, p1, p0}, Lcom/android/wm/shell/sysui/ShellInit;->addInitCallback(Ljava/lang/Runnable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public static addMoveToDesktopChanges(Landroid/window/WindowContainerTransaction;Landroid/window/WindowContainerToken;)V
    .locals 4

    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Landroid/window/WindowContainerTransaction;->setWindowingMode(Landroid/window/WindowContainerToken;I)Landroid/window/WindowContainerTransaction;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/window/WindowContainerTransaction;->reorder(Landroid/window/WindowContainerToken;Z)Landroid/window/WindowContainerTransaction;

    sget-object v1, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_ALLOWED_RANGE:Lkotlin/ranges/IntRange;

    iget v2, v1, Lkotlin/ranges/IntProgression;->first:I

    iget v1, v1, Lkotlin/ranges/IntProgression;->last:I

    sget v3, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_OVERRIDE:I

    if-gt v2, v3, :cond_0

    if-gt v3, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0, p1, v3}, Landroid/window/WindowContainerTransaction;->setDensityDpi(Landroid/window/WindowContainerToken;I)Landroid/window/WindowContainerTransaction;

    :cond_1
    return-void
.end method


# virtual methods
.method public final addMoveToFullscreenChanges(Landroid/window/WindowContainerTransaction;Landroid/window/WindowContainerToken;)V
    .locals 4

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/window/WindowContainerTransaction;->setWindowingMode(Landroid/window/WindowContainerToken;I)Landroid/window/WindowContainerTransaction;

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1}, Landroid/window/WindowContainerTransaction;->setBounds(Landroid/window/WindowContainerToken;Landroid/graphics/Rect;)Landroid/window/WindowContainerTransaction;

    sget-object v1, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_ALLOWED_RANGE:Lkotlin/ranges/IntRange;

    iget v2, v1, Lkotlin/ranges/IntProgression;->first:I

    iget v1, v1, Lkotlin/ranges/IntProgression;->last:I

    sget v3, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->DESKTOP_DENSITY_OVERRIDE:I

    if-gt v2, v3, :cond_0

    if-gt v3, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {p1, p2, p0}, Landroid/window/WindowContainerTransaction;->setDensityDpi(Landroid/window/WindowContainerToken;I)Landroid/window/WindowContainerTransaction;

    :cond_1
    return-void
.end method

.method public final bringDesktopAppsToFront(ILandroid/window/WindowContainerTransaction;)V
    .locals 4

    sget-object v0, Lcom/android/wm/shell/protolog/ShellProtoLogGroup;->WM_SHELL_DESKTOP_MODE:Lcom/android/wm/shell/protolog/ShellProtoLogGroup;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->isEnabled(Lcom/android/wm/shell/protolog/ShellProtoLogGroup;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Lcom/android/internal/protolog/common/IProtoLogGroup;->getTag()Ljava/lang/String;

    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "DesktopTasksController: bringDesktopAppsToFront"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->desktopModeTaskRepository:Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;

    invoke-virtual {v0, p1}, Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;->getActiveTasks(I)Landroid/util/ArraySet;

    move-result-object p1

    invoke-virtual {p0, p2}, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->moveHomeTaskToFront(Landroid/window/WindowContainerTransaction;)V

    iget-object v0, v0, Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;->freeformTasksInZOrder:Ljava/util/List;

    new-instance v1, Lcom/android/wm/shell/desktopmode/DesktopTasksController$bringDesktopAppsToFront$$inlined$sortedByDescending$1;

    invoke-direct {v1, v0}, Lcom/android/wm/shell/desktopmode/DesktopTasksController$bringDesktopAppsToFront$$inlined$sortedByDescending$1;-><init>(Ljava/util/List;)V

    invoke-static {p1, v1}, Lkotlin/collections/CollectionsKt___CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->shellTaskOrganizer:Lcom/android/wm/shell/ShellTaskOrganizer;

    invoke-virtual {v2, v1}, Lcom/android/wm/shell/ShellTaskOrganizer;->getRunningTaskInfo(I)Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->token:Landroid/window/WindowContainerToken;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/window/WindowContainerTransaction;->reorder(Landroid/window/WindowContainerToken;Z)Landroid/window/WindowContainerTransaction;

    goto :goto_1

    :cond_3
    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->context:Landroid/content/Context;

    return-object p0
.end method

.method public final getRemoteCallExecutor()Lcom/android/wm/shell/common/ShellExecutor;
    .locals 0

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->mainExecutor:Lcom/android/wm/shell/common/ShellExecutor;

    return-object p0
.end method

.method public final getStatusBarHeight(Landroid/app/ActivityManager$RunningTaskInfo;)I
    .locals 0

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->displayController:Lcom/android/wm/shell/common/DisplayController;

    iget p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->displayId:I

    invoke-virtual {p0, p1}, Lcom/android/wm/shell/common/DisplayController;->getDisplayLayout(I)Lcom/android/wm/shell/common/DisplayLayout;

    move-result-object p0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lcom/android/wm/shell/common/DisplayLayout;->mStableInsets:Landroid/graphics/Rect;

    if-eqz p0, :cond_0

    iget p0, p0, Landroid/graphics/Rect;->top:I

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public final handleRequest(Landroid/os/IBinder;Landroid/window/TransitionRequestInfo;)Landroid/window/WindowContainerTransaction;
    .locals 7

    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getType()I

    move-result p1

    const/4 v0, 0x5

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v2, :cond_0

    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getType()I

    move-result p1

    const/4 v3, 0x3

    if-eq p1, v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getTriggerTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getTriggerTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    move-result p1

    if-eq p1, v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getTriggerTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    move-result p1

    if-eq p1, v2, :cond_3

    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getTriggerTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    move-result p1

    if-eq p1, v0, :cond_3

    :goto_0
    move p1, v1

    goto :goto_1

    :cond_3
    move p1, v2

    :goto_1
    const/4 v3, 0x0

    if-nez p1, :cond_4

    return-object v3

    :cond_4
    invoke-virtual {p2}, Landroid/window/TransitionRequestInfo;->getTriggerTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    iget p2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->displayId:I

    iget-object v4, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->desktopModeTaskRepository:Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;

    invoke-virtual {v4, p2}, Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;->getActiveTasks(I)Landroid/util/ArraySet;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    move-result v5

    if-ne v5, v2, :cond_9

    invoke-virtual {p2}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p2}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;->isVisibleTask(I)Z

    move-result v6

    if-eqz v6, :cond_6

    move v5, v2

    goto :goto_3

    :cond_7
    :goto_2
    move v5, v1

    :goto_3
    if-eqz v5, :cond_9

    sget-object p0, Lcom/android/wm/shell/protolog/ShellProtoLogGroup;->WM_SHELL_DESKTOP_MODE:Lcom/android/wm/shell/protolog/ShellProtoLogGroup;

    iget p2, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->isEnabled(Lcom/android/wm/shell/protolog/ShellProtoLogGroup;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p0}, Lcom/android/internal/protolog/common/IProtoLogGroup;->getTag()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    const-string v0, "DesktopTasksController: switch fullscreen task to freeform on transition taskId=%d"

    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    new-instance p0, Landroid/window/WindowContainerTransaction;

    invoke-direct {p0}, Landroid/window/WindowContainerTransaction;-><init>()V

    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->token:Landroid/window/WindowContainerToken;

    invoke-static {p0, p1}, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->addMoveToDesktopChanges(Landroid/window/WindowContainerTransaction;Landroid/window/WindowContainerToken;)V

    return-object p0

    :cond_9
    invoke-virtual {p1}, Landroid/app/ActivityManager$RunningTaskInfo;->getWindowingMode()I

    move-result v5

    if-ne v5, v0, :cond_e

    invoke-virtual {p2}, Landroid/util/ArraySet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_4

    :cond_a
    invoke-virtual {p2}, Landroid/util/ArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_b
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v4, v0}, Lcom/android/wm/shell/desktopmode/DesktopModeTaskRepository;->isVisibleTask(I)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_5

    :cond_c
    :goto_4
    move v1, v2

    :goto_5
    if-eqz v1, :cond_e

    sget-object p2, Lcom/android/wm/shell/protolog/ShellProtoLogGroup;->WM_SHELL_DESKTOP_MODE:Lcom/android/wm/shell/protolog/ShellProtoLogGroup;

    iget v0, p1, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p2}, Lcom/android/wm/shell/protolog/ShellProtoLogImpl;->isEnabled(Lcom/android/wm/shell/protolog/ShellProtoLogGroup;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {p2}, Lcom/android/internal/protolog/common/IProtoLogGroup;->getTag()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "DesktopTasksController: switch freeform task to fullscreen oon transition taskId=%d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    new-instance p2, Landroid/window/WindowContainerTransaction;

    invoke-direct {p2}, Landroid/window/WindowContainerTransaction;-><init>()V

    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->token:Landroid/window/WindowContainerToken;

    invoke-virtual {p0, p2, p1}, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->addMoveToFullscreenChanges(Landroid/window/WindowContainerTransaction;Landroid/window/WindowContainerToken;)V

    return-object p2

    :cond_e
    return-object v3
.end method

.method public final moveHomeTaskToFront(Landroid/window/WindowContainerTransaction;)V
    .locals 4

    iget-object v0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getDisplayId()I

    move-result v0

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->shellTaskOrganizer:Lcom/android/wm/shell/ShellTaskOrganizer;

    invoke-virtual {p0, v0}, Lcom/android/wm/shell/ShellTaskOrganizer;->getRunningTasks(I)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/app/ActivityManager$RunningTaskInfo;

    invoke-virtual {v2}, Landroid/app/ActivityManager$RunningTaskInfo;->getActivityType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    move v2, v1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    check-cast v0, Landroid/app/ActivityManager$RunningTaskInfo;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/ActivityManager$RunningTaskInfo;->getToken()Landroid/window/WindowContainerToken;

    move-result-object p0

    invoke-virtual {p1, p0, v1}, Landroid/window/WindowContainerTransaction;->reorder(Landroid/window/WindowContainerToken;Z)Landroid/window/WindowContainerTransaction;

    :cond_3
    return-void
.end method

.method public final releaseVisualIndicator()V
    .locals 4

    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    iget-object v1, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->visualIndicator:Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v3, v1, Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;->mViewHost:Landroid/view/SurfaceControlViewHost;

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Landroid/view/SurfaceControlViewHost;->release()V

    iput-object v2, v1, Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;->mViewHost:Landroid/view/SurfaceControlViewHost;

    iget-object v3, v1, Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;->mLeash:Landroid/view/SurfaceControl;

    if-eqz v3, :cond_1

    invoke-virtual {v0, v3}, Landroid/view/SurfaceControl$Transaction;->remove(Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    iput-object v2, v1, Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;->mLeash:Landroid/view/SurfaceControl;

    :cond_1
    :goto_0
    iput-object v2, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->visualIndicator:Lcom/android/wm/shell/desktopmode/DesktopModeVisualIndicator;

    new-instance v1, Lcom/android/wm/shell/desktopmode/DesktopTasksController$releaseVisualIndicator$1;

    invoke-direct {v1, v0}, Lcom/android/wm/shell/desktopmode/DesktopTasksController$releaseVisualIndicator$1;-><init>(Landroid/view/SurfaceControl$Transaction;)V

    iget-object p0, p0, Lcom/android/wm/shell/desktopmode/DesktopTasksController;->syncQueue:Lcom/android/wm/shell/common/SyncTransactionQueue;

    invoke-virtual {p0, v1}, Lcom/android/wm/shell/common/SyncTransactionQueue;->runInSync(Lcom/android/wm/shell/common/SyncTransactionQueue$TransactionRunnable;)V

    return-void
.end method

.method public final startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl$Transaction;Lcom/android/wm/shell/transition/Transitions$TransitionFinishCallback;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
