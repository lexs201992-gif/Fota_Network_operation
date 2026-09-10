.class public final Lcom/android/systemui/biometrics/UdfpsShell;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"

# interfaces
.implements Lcom/android/systemui/statusbar/commandline/Command;


# instance fields
.field public udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;


# direct methods
.method public constructor <init>(Lcom/android/systemui/statusbar/commandline/CommandRegistry;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/systemui/biometrics/UdfpsShell$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/biometrics/UdfpsShell$1;-><init>(Lcom/android/systemui/biometrics/UdfpsShell;)V

    const-string/jumbo p0, "udfps"

    invoke-virtual {p1, p0, v0}, Lcom/android/systemui/statusbar/commandline/CommandRegistry;->registerCommand(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static obtainMotionEvent(FFI)Landroid/view/MotionEvent;
    .locals 19

    new-instance v0, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v0}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    const/4 v1, 0x1

    iput v1, v0, Landroid/view/MotionEvent$PointerProperties;->id:I

    new-instance v1, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    move/from16 v2, p0

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->x:F

    move/from16 v2, p1

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->y:F

    const/high16 v2, 0x41200000    # 10.0f

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->touchMinor:F

    iput v2, v1, Landroid/view/MotionEvent$PointerCoords;->touchMajor:F

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const/4 v8, 0x1

    filled-new-array {v0}, [Landroid/view/MotionEvent$PointerProperties;

    move-result-object v9

    filled-new-array {v1}, [Landroid/view/MotionEvent$PointerCoords;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/high16 v13, 0x3f800000    # 1.0f

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move/from16 v7, p2

    invoke-static/range {v3 .. v18}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final execute(Ljava/io/PrintWriter;Ljava/util/List;)V
    .locals 8

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v3, "hide"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    if-eqz p0, :cond_b

    invoke-virtual {p0, v1}, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->hideUdfpsOverlay(I)V

    goto/16 :goto_2

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v4, "show"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p2

    sparse-switch p2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string p2, "auth-other"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x5

    goto :goto_0

    :sswitch_1
    const-string p2, "enroll-enrolling"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v6, v3

    goto :goto_1

    :sswitch_2
    const-string p2, "auth-settings"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x6

    goto :goto_0

    :sswitch_3
    const-string p2, "auth-bp"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x3

    goto :goto_0

    :sswitch_4
    const-string p2, "enroll-find-sensor"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    move v6, v2

    goto :goto_1

    :sswitch_5
    const-string p2, "auth-keyguard"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    const/4 v1, 0x4

    :goto_0
    move v6, v1

    :goto_1
    iget-object v2, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    if-eqz v2, :cond_b

    const-wide/16 v3, 0x2

    const/4 v5, 0x0

    new-instance v7, Lcom/android/systemui/biometrics/UdfpsShell$showOverlay$1;

    invoke-direct {v7}, Lcom/android/systemui/biometrics/UdfpsShell$showOverlay$1;-><init>()V

    invoke-virtual/range {v2 .. v7}, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->showUdfpsOverlay(JIILandroid/hardware/fingerprint/IUdfpsOverlayControllerCallback;)V

    goto/16 :goto_2

    :cond_7
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v2, :cond_8

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string v3, "onUiReady"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/android/systemui/biometrics/UdfpsShell;->onUiReady()V

    goto :goto_2

    :cond_8
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v2, :cond_9

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v3, "simFingerDown"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lcom/android/systemui/biometrics/UdfpsShell;->simFingerDown()V

    goto :goto_2

    :cond_9
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v2, :cond_a

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    const-string/jumbo v0, "simFingerUp"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_a

    invoke-virtual {p0}, Lcom/android/systemui/biometrics/UdfpsShell;->simFingerUp()V

    goto :goto_2

    :cond_a
    const-string p0, "invalid command"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "Usage: adb shell cmd statusbar udfps <cmd>"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "Supported commands:"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  - show <reason>"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "    -> supported reasons: [enroll-find-sensor, enroll-enrolling, auth-bp, auth-keyguard, auth-other, auth-settings]"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "    -> reason otherwise defaults to unknown"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  - hide"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  - onUiReady"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  - simFingerDown"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "    -> Simulates onFingerDown on sensor"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "  - simFingerUp"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const-string p0, "    -> Simulates onFingerUp on sensor"

    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_b
    :goto_2
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x385bd9d5 -> :sswitch_5
        -0x38361059 -> :sswitch_4
        -0x2689e96d -> :sswitch_3
        -0x128c158 -> :sswitch_2
        0xe93d915 -> :sswitch_1
        0x35c792ab -> :sswitch_0
    .end sparse-switch
.end method

.method public final onUiReady()V
    .locals 3

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    if-eqz p0, :cond_1

    iget-object v0, p0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v0, p0, Lcom/android/systemui/biometrics/UdfpsController;->mOverlay:Lcom/android/systemui/biometrics/UdfpsControllerOverlay;

    if-eqz v0, :cond_0

    iget-wide v0, v0, Lcom/android/systemui/biometrics/UdfpsControllerOverlay;->requestId:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsController;->mFingerprintManager:Landroid/hardware/fingerprint/FingerprintManager;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Landroid/hardware/fingerprint/FingerprintManager;->onUiReady(JI)V

    :cond_1
    return-void
.end method

.method public final simFingerDown()V
    .locals 8

    iget-object v0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, v0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v0, v0, Lcom/android/systemui/biometrics/UdfpsController;->mOverlayParams:Lcom/android/settingslib/udfps/UdfpsOverlayParams;

    iget-object v0, v0, Lcom/android/settingslib/udfps/UdfpsOverlayParams;->sensorBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/android/systemui/biometrics/UdfpsShell;->obtainMotionEvent(FFI)Landroid/view/MotionEvent;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    const/4 v3, 0x1

    const-wide/16 v4, 0x0

    if-eqz v2, :cond_1

    iget-object v2, v2, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v6, v2, Lcom/android/systemui/biometrics/UdfpsController;->mOverlay:Lcom/android/systemui/biometrics/UdfpsControllerOverlay;

    if-eqz v6, :cond_0

    iget-wide v6, v6, Lcom/android/systemui/biometrics/UdfpsControllerOverlay;->requestId:J

    goto :goto_0

    :cond_0
    move-wide v6, v4

    :goto_0
    invoke-virtual {v2, v6, v7, v1, v3}, Lcom/android/systemui/biometrics/UdfpsController;->onTouch(JLandroid/view/MotionEvent;Z)Z

    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    const/4 v6, 0x2

    invoke-static {v2, v0, v6}, Lcom/android/systemui/biometrics/UdfpsShell;->obtainMotionEvent(FFI)Landroid/view/MotionEvent;

    move-result-object v0

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    if-eqz p0, :cond_3

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v2, p0, Lcom/android/systemui/biometrics/UdfpsController;->mOverlay:Lcom/android/systemui/biometrics/UdfpsControllerOverlay;

    if-eqz v2, :cond_2

    iget-wide v4, v2, Lcom/android/systemui/biometrics/UdfpsControllerOverlay;->requestId:J

    :cond_2
    invoke-virtual {p0, v4, v5, v0, v3}, Lcom/android/systemui/biometrics/UdfpsController;->onTouch(JLandroid/view/MotionEvent;Z)Z

    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_4
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_5
    return-void
.end method

.method public final simFingerUp()V
    .locals 5

    iget-object v0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, v0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v0, v0, Lcom/android/systemui/biometrics/UdfpsController;->mOverlayParams:Lcom/android/settingslib/udfps/UdfpsOverlayParams;

    iget-object v0, v0, Lcom/android/settingslib/udfps/UdfpsOverlayParams;->sensorBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lcom/android/systemui/biometrics/UdfpsShell;->obtainMotionEvent(FFI)Landroid/view/MotionEvent;

    move-result-object v0

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsShell;->udfpsOverlayController:Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;

    if-eqz p0, :cond_1

    iget-object p0, p0, Lcom/android/systemui/biometrics/UdfpsController$UdfpsOverlayController;->this$0:Lcom/android/systemui/biometrics/UdfpsController;

    iget-object v1, p0, Lcom/android/systemui/biometrics/UdfpsController;->mOverlay:Lcom/android/systemui/biometrics/UdfpsControllerOverlay;

    if-eqz v1, :cond_0

    iget-wide v3, v1, Lcom/android/systemui/biometrics/UdfpsControllerOverlay;->requestId:J

    goto :goto_0

    :cond_0
    const-wide/16 v3, 0x0

    :goto_0
    invoke-virtual {p0, v3, v4, v0, v2}, Lcom/android/systemui/biometrics/UdfpsController;->onTouch(JLandroid/view/MotionEvent;Z)Z

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_2
    return-void
.end method
