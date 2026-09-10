.class public final Lcom/android/systemui/wmshell/WMShell;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Lcom/android/systemui/CoreStartable;
.implements Lcom/android/systemui/statusbar/CommandQueue$Callbacks;
.implements Lcom/android/systemui/shared/tracing/ProtoTraceable;


# instance fields
.field public final mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

.field public final mConfigurationController:Lcom/android/systemui/statusbar/policy/ConfigurationController;

.field public final mConfigurationListener:Lcom/android/systemui/wmshell/WMShell$1;

.field public final mContext:Landroid/content/Context;

.field public final mDesktopModeOptional:Ljava/util/Optional;

.field public final mDisplayTracker:Lcom/android/systemui/settings/DisplayTracker;

.field public final mKeyguardStateCallback:Lcom/android/systemui/wmshell/WMShell$2;

.field public final mKeyguardStateController:Lcom/android/systemui/statusbar/policy/KeyguardStateController;

.field public final mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

.field public final mKeyguardUpdateMonitorCallback:Lcom/android/keyguard/KeyguardUpdateMonitorCallback;

.field public final mNoteTaskInitializer:Lcom/android/systemui/notetask/NoteTaskInitializer;

.field public final mOneHandedOptional:Ljava/util/Optional;

.field public final mPipOptional:Ljava/util/Optional;

.field public final mProtoTracer:Lcom/android/systemui/tracing/ProtoTracer;

.field public final mScreenLifecycle:Lcom/android/systemui/keyguard/ScreenLifecycle;

.field public final mShell:Lcom/android/wm/shell/sysui/ShellInterface;

.field public final mSplitScreenOptional:Ljava/util/Optional;

.field public final mSysUiMainExecutor:Ljava/util/concurrent/Executor;

.field public final mSysUiState:Lcom/android/systemui/model/SysUiState;

.field public final mUserChangedCallback:Lcom/android/systemui/settings/UserTracker$Callback;

.field public final mUserTracker:Lcom/android/systemui/settings/UserTracker;

.field public final mWakefulnessLifecycle:Lcom/android/systemui/keyguard/WakefulnessLifecycle;

.field public mWakefulnessObserver:Lcom/android/systemui/wmshell/WMShell$10;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/wm/shell/sysui/ShellInterface;Ljava/util/Optional;Ljava/util/Optional;Ljava/util/Optional;Ljava/util/Optional;Lcom/android/systemui/statusbar/CommandQueue;Lcom/android/systemui/statusbar/policy/ConfigurationController;Lcom/android/systemui/statusbar/policy/KeyguardStateController;Lcom/android/keyguard/KeyguardUpdateMonitor;Lcom/android/systemui/keyguard/ScreenLifecycle;Lcom/android/systemui/model/SysUiState;Lcom/android/systemui/tracing/ProtoTracer;Lcom/android/systemui/keyguard/WakefulnessLifecycle;Lcom/android/systemui/settings/UserTracker;Lcom/android/systemui/settings/DisplayTracker;Lcom/android/systemui/notetask/NoteTaskInitializer;Ljava/util/concurrent/Executor;)V
    .locals 2

    move-object v0, p0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lcom/android/systemui/wmshell/WMShell$1;

    invoke-direct {v1, p0}, Lcom/android/systemui/wmshell/WMShell$1;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mConfigurationListener:Lcom/android/systemui/wmshell/WMShell$1;

    new-instance v1, Lcom/android/systemui/wmshell/WMShell$2;

    invoke-direct {v1, p0}, Lcom/android/systemui/wmshell/WMShell$2;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardStateCallback:Lcom/android/systemui/wmshell/WMShell$2;

    new-instance v1, Lcom/android/systemui/wmshell/WMShell$3;

    invoke-direct {v1, p0}, Lcom/android/systemui/wmshell/WMShell$3;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardUpdateMonitorCallback:Lcom/android/keyguard/KeyguardUpdateMonitorCallback;

    new-instance v1, Lcom/android/systemui/wmshell/WMShell$4;

    invoke-direct {v1, p0}, Lcom/android/systemui/wmshell/WMShell$4;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mUserChangedCallback:Lcom/android/systemui/settings/UserTracker$Callback;

    move-object v1, p1

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mContext:Landroid/content/Context;

    move-object v1, p2

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mShell:Lcom/android/wm/shell/sysui/ShellInterface;

    move-object v1, p7

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    move-object v1, p8

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mConfigurationController:Lcom/android/systemui/statusbar/policy/ConfigurationController;

    move-object v1, p9

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardStateController:Lcom/android/systemui/statusbar/policy/KeyguardStateController;

    move-object v1, p10

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    move-object v1, p11

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mScreenLifecycle:Lcom/android/systemui/keyguard/ScreenLifecycle;

    move-object v1, p12

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mSysUiState:Lcom/android/systemui/model/SysUiState;

    move-object v1, p3

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mPipOptional:Ljava/util/Optional;

    move-object v1, p4

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mSplitScreenOptional:Ljava/util/Optional;

    move-object v1, p5

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mOneHandedOptional:Ljava/util/Optional;

    move-object v1, p6

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mDesktopModeOptional:Ljava/util/Optional;

    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mWakefulnessLifecycle:Lcom/android/systemui/keyguard/WakefulnessLifecycle;

    move-object v1, p13

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mProtoTracer:Lcom/android/systemui/tracing/ProtoTracer;

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mUserTracker:Lcom/android/systemui/settings/UserTracker;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mDisplayTracker:Lcom/android/systemui/settings/DisplayTracker;

    move-object/from16 v1, p17

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mNoteTaskInitializer:Lcom/android/systemui/notetask/NoteTaskInitializer;

    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/android/systemui/wmshell/WMShell;->mSysUiMainExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method public final dump(Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/android/systemui/wmshell/WMShell;->mShell:Lcom/android/wm/shell/sysui/ShellInterface;

    invoke-interface {p0, p1, p2}, Lcom/android/wm/shell/sysui/ShellInterface;->handleCommand(Ljava/io/PrintWriter;[Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    invoke-interface {p0, p1}, Lcom/android/wm/shell/sysui/ShellInterface;->dump(Ljava/io/PrintWriter;)V

    return-void
.end method

.method public initOneHanded(Lcom/android/wm/shell/onehanded/OneHanded;)V
    .locals 5

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$8;

    invoke-direct {v0, p0}, Lcom/android/systemui/wmshell/WMShell$8;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    move-object v1, p1

    check-cast v1, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl;

    iget-object v2, v1, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl;->this$0:Lcom/android/wm/shell/onehanded/OneHandedController;

    iget-object v2, v2, Lcom/android/wm/shell/onehanded/OneHandedController;->mMainExecutor:Lcom/android/wm/shell/common/ShellExecutor;

    new-instance v3, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl$$ExternalSyntheticLambda0;

    const/4 v4, 0x1

    invoke-direct {v3, v1, v0, v4}, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl$$ExternalSyntheticLambda0;-><init>(Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl;Ljava/lang/Object;I)V

    check-cast v2, Lcom/android/wm/shell/common/HandlerExecutor;

    invoke-virtual {v2, v3}, Lcom/android/wm/shell/common/HandlerExecutor;->execute(Ljava/lang/Runnable;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$9;

    invoke-direct {v0, p0}, Lcom/android/systemui/wmshell/WMShell$9;-><init>(Lcom/android/systemui/wmshell/WMShell;)V

    iget-object v2, v1, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl;->this$0:Lcom/android/wm/shell/onehanded/OneHandedController;

    iget-object v2, v2, Lcom/android/wm/shell/onehanded/OneHandedController;->mMainExecutor:Lcom/android/wm/shell/common/ShellExecutor;

    new-instance v3, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl$$ExternalSyntheticLambda0;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v0, v4}, Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl$$ExternalSyntheticLambda0;-><init>(Lcom/android/wm/shell/onehanded/OneHandedController$OneHandedImpl;Ljava/lang/Object;I)V

    check-cast v2, Lcom/android/wm/shell/common/HandlerExecutor;

    invoke-virtual {v2, v3}, Lcom/android/wm/shell/common/HandlerExecutor;->execute(Ljava/lang/Runnable;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$10;

    invoke-direct {v0, p1}, Lcom/android/systemui/wmshell/WMShell$10;-><init>(Lcom/android/wm/shell/onehanded/OneHanded;)V

    iput-object v0, p0, Lcom/android/systemui/wmshell/WMShell;->mWakefulnessObserver:Lcom/android/systemui/wmshell/WMShell$10;

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mWakefulnessLifecycle:Lcom/android/systemui/keyguard/WakefulnessLifecycle;

    iget-object v1, v1, Lcom/android/systemui/keyguard/Lifecycle;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$11;

    invoke-direct {v0, p1}, Lcom/android/systemui/wmshell/WMShell$11;-><init>(Lcom/android/wm/shell/onehanded/OneHanded;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mScreenLifecycle:Lcom/android/systemui/keyguard/ScreenLifecycle;

    iget-object v1, v1, Lcom/android/systemui/keyguard/Lifecycle;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$12;

    invoke-direct {v0, p0, p1}, Lcom/android/systemui/wmshell/WMShell$12;-><init>(Lcom/android/systemui/wmshell/WMShell;Lcom/android/wm/shell/onehanded/OneHanded;)V

    iget-object p0, p0, Lcom/android/systemui/wmshell/WMShell;->mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/CommandQueue;->addCallback(Lcom/android/systemui/statusbar/CommandQueue$Callbacks;)V

    return-void
.end method

.method public initPip(Lcom/android/wm/shell/pip/Pip;)V
    .locals 2

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$5;

    invoke-direct {v0, p1}, Lcom/android/systemui/wmshell/WMShell$5;-><init>(Lcom/android/wm/shell/pip/Pip;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    invoke-virtual {v1, v0}, Lcom/android/systemui/statusbar/CommandQueue;->addCallback(Lcom/android/systemui/statusbar/CommandQueue$Callbacks;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda0;-><init>(Lcom/android/systemui/wmshell/WMShell;Lcom/android/wm/shell/pip/Pip;)V

    iget-object p0, p0, Lcom/android/systemui/wmshell/WMShell;->mSysUiState:Lcom/android/systemui/model/SysUiState;

    iget-object p1, p0, Lcom/android/systemui/model/SysUiState;->mCallbacks:Ljava/util/List;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p0, p0, Lcom/android/systemui/model/SysUiState;->mFlags:I

    invoke-virtual {v0, p0}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda0;->onSystemUiStateChanged(I)V

    return-void
.end method

.method public initSplitScreen(Lcom/android/wm/shell/splitscreen/SplitScreen;)V
    .locals 2

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$6;

    invoke-direct {v0, p1}, Lcom/android/systemui/wmshell/WMShell$6;-><init>(Lcom/android/wm/shell/splitscreen/SplitScreen;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mWakefulnessLifecycle:Lcom/android/systemui/keyguard/WakefulnessLifecycle;

    iget-object v1, v1, Lcom/android/systemui/keyguard/Lifecycle;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$7;

    invoke-direct {v0, p1}, Lcom/android/systemui/wmshell/WMShell$7;-><init>(Lcom/android/wm/shell/splitscreen/SplitScreen;)V

    iget-object p0, p0, Lcom/android/systemui/wmshell/WMShell;->mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/CommandQueue;->addCallback(Lcom/android/systemui/statusbar/CommandQueue$Callbacks;)V

    return-void
.end method

.method public final start()V
    .locals 6

    iget-object v0, p0, Lcom/android/systemui/wmshell/WMShell;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mShell:Lcom/android/wm/shell/sysui/ShellInterface;

    invoke-interface {v2, v1}, Lcom/android/wm/shell/sysui/ShellInterface;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mConfigurationListener:Lcom/android/systemui/wmshell/WMShell$1;

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mConfigurationController:Lcom/android/systemui/statusbar/policy/ConfigurationController;

    check-cast v2, Lcom/android/systemui/statusbar/phone/ConfigurationControllerImpl;

    invoke-virtual {v2, v1}, Lcom/android/systemui/statusbar/phone/ConfigurationControllerImpl;->addCallback(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardStateCallback:Lcom/android/systemui/wmshell/WMShell$2;

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardStateController:Lcom/android/systemui/statusbar/policy/KeyguardStateController;

    check-cast v2, Lcom/android/systemui/statusbar/policy/KeyguardStateControllerImpl;

    invoke-virtual {v2, v1}, Lcom/android/systemui/statusbar/policy/KeyguardStateControllerImpl;->addCallback(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mKeyguardUpdateMonitorCallback:Lcom/android/keyguard/KeyguardUpdateMonitorCallback;

    invoke-virtual {v1, v2}, Lcom/android/keyguard/KeyguardUpdateMonitor;->registerCallback(Lcom/android/keyguard/KeyguardUpdateMonitorCallback;)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mUserChangedCallback:Lcom/android/systemui/settings/UserTracker$Callback;

    invoke-virtual {v0}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mUserTracker:Lcom/android/systemui/settings/UserTracker;

    check-cast v2, Lcom/android/systemui/settings/UserTrackerImpl;

    invoke-virtual {v2, v1, v0}, Lcom/android/systemui/settings/UserTrackerImpl;->addCallback(Lcom/android/systemui/settings/UserTracker$Callback;Ljava/util/concurrent/Executor;)V

    iget-object v0, p0, Lcom/android/systemui/wmshell/WMShell;->mProtoTracer:Lcom/android/systemui/tracing/ProtoTracer;

    iget-object v0, v0, Lcom/android/systemui/tracing/ProtoTracer;->mProtoTracer:Lcom/android/systemui/shared/tracing/FrameProtoTracer;

    iget-object v1, v0, Lcom/android/systemui/shared/tracing/FrameProtoTracer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, v0, Lcom/android/systemui/shared/tracing/FrameProtoTracer;->mTraceables:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/systemui/wmshell/WMShell;->mCommandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    invoke-virtual {v0, p0}, Lcom/android/systemui/statusbar/CommandQueue;->addCallback(Lcom/android/systemui/statusbar/CommandQueue$Callbacks;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/wmshell/WMShell;I)V

    iget-object v1, p0, Lcom/android/systemui/wmshell/WMShell;->mPipOptional:Ljava/util/Optional;

    invoke-virtual {v1, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/wmshell/WMShell;I)V

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mSplitScreenOptional:Ljava/util/Optional;

    invoke-virtual {v2, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;

    const/4 v2, 0x2

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/wmshell/WMShell;I)V

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mOneHandedOptional:Ljava/util/Optional;

    invoke-virtual {v2, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    new-instance v0, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;

    const/4 v2, 0x3

    invoke-direct {v0, p0, v2}, Lcom/android/systemui/wmshell/WMShell$$ExternalSyntheticLambda1;-><init>(Lcom/android/systemui/wmshell/WMShell;I)V

    iget-object v2, p0, Lcom/android/systemui/wmshell/WMShell;->mDesktopModeOptional:Ljava/util/Optional;

    invoke-virtual {v2, v0}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    iget-object p0, p0, Lcom/android/systemui/wmshell/WMShell;->mNoteTaskInitializer:Lcom/android/systemui/notetask/NoteTaskInitializer;

    iget-boolean v0, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->isEnabled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->optionalBubbles:Ljava/util/Optional;

    invoke-virtual {v0}, Ljava/util/Optional;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/android/systemui/notetask/NoteTaskInitializer$initializeHandleSystemKey$callbacks$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/notetask/NoteTaskInitializer$initializeHandleSystemKey$callbacks$1;-><init>(Lcom/android/systemui/notetask/NoteTaskInitializer;)V

    iget-object v2, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->commandQueue:Lcom/android/systemui/statusbar/CommandQueue;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/CommandQueue;->addCallback(Lcom/android/systemui/statusbar/CommandQueue$Callbacks;)V

    new-instance v0, Lcom/android/systemui/notetask/NoteTaskInitializer$initializeOnRoleHoldersChanged$1;

    iget-object v2, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->controller:Lcom/android/systemui/notetask/NoteTaskController;

    invoke-direct {v0, v2}, Lcom/android/systemui/notetask/NoteTaskInitializer$initializeOnRoleHoldersChanged$1;-><init>(Lcom/android/systemui/notetask/NoteTaskController;)V

    sget-object v3, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    iget-object v4, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->roleManager:Landroid/app/role/RoleManager;

    iget-object v5, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->backgroundExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v4, v5, v0, v3}, Landroid/app/role/RoleManager;->addOnRoleHoldersChangedListenerAsUser(Ljava/util/concurrent/Executor;Landroid/app/role/OnRoleHoldersChangedListener;Landroid/os/UserHandle;)V

    iget-object v0, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->userTracker:Lcom/android/systemui/settings/UserTracker;

    check-cast v0, Lcom/android/systemui/settings/UserTrackerImpl;

    invoke-virtual {v0}, Lcom/android/systemui/settings/UserTrackerImpl;->getUserId()I

    move-result v3

    iget-object v4, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->keyguardUpdateMonitor:Lcom/android/keyguard/KeyguardUpdateMonitor;

    iget-object v5, v4, Lcom/android/keyguard/KeyguardUpdateMonitor;->mUserIsUnlocked:Landroid/util/SparseBooleanArray;

    invoke-virtual {v5, v3}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lcom/android/systemui/settings/UserTrackerImpl;->getUserHandle()Landroid/os/UserHandle;

    move-result-object p0

    invoke-virtual {v2, v1, p0}, Lcom/android/systemui/notetask/NoteTaskController;->setNoteTaskShortcutEnabled(ZLandroid/os/UserHandle;)V

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lcom/android/systemui/notetask/NoteTaskInitializer;->onUserUnlockedCallback:Lcom/android/systemui/notetask/NoteTaskInitializer$onUserUnlockedCallback$1;

    invoke-virtual {v4, p0}, Lcom/android/keyguard/KeyguardUpdateMonitor;->registerCallback(Lcom/android/keyguard/KeyguardUpdateMonitorCallback;)V

    :cond_2
    :goto_0
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final bridge synthetic writeToProto(Lcom/android/systemui/tracing/nano/SystemUiTraceProto;)V
    .locals 0

    return-void
.end method
