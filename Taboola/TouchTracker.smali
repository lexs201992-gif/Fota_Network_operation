.class public final Lcom/android/wm/shell/back/TouchTracker;
.super Ljava/lang/Object;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"


# static fields
.field public static final LINEAR_DISTANCE:I


# instance fields
.field public mCancelled:Z

.field public mInitTouchX:F

.field public mInitTouchY:F

.field public mLatestTouchX:F

.field public mLatestTouchY:F

.field public mLatestVelocityX:F

.field public mLatestVelocityY:F

.field public mLinearDistance:F

.field public mMaxDistance:F

.field public mNonLinearFactor:F

.field public mStartThresholdX:F

.field public mSwipeEdge:I

.field public mTriggerBack:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    const-string v0, "persist.wm.debug.predictive_back_linear_distance"

    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/wm/shell/back/TouchTracker;->LINEAR_DISTANCE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lcom/android/wm/shell/back/TouchTracker;->LINEAR_DISTANCE:I

    int-to-float v0, v0

    iput v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mLinearDistance:F

    return-void
.end method


# virtual methods
.method public final createProgressEvent()Landroid/window/BackMotionEvent;
    .locals 9

    iget-boolean v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mCancelled:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mLatestTouchX:F

    invoke-virtual {p0, v0}, Lcom/android/wm/shell/back/TouchTracker;->getProgress(F)F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v4, v0

    new-instance v0, Landroid/window/BackMotionEvent;

    iget v2, p0, Lcom/android/wm/shell/back/TouchTracker;->mLatestTouchX:F

    iget v3, p0, Lcom/android/wm/shell/back/TouchTracker;->mLatestTouchY:F

    iget v5, p0, Lcom/android/wm/shell/back/TouchTracker;->mLatestVelocityX:F

    iget v6, p0, Lcom/android/wm/shell/back/TouchTracker;->mLatestVelocityY:F

    iget v7, p0, Lcom/android/wm/shell/back/TouchTracker;->mSwipeEdge:I

    const/4 v8, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Landroid/window/BackMotionEvent;-><init>(FFFFFILandroid/view/RemoteAnimationTarget;)V

    return-object v0
.end method

.method public final getProgress(F)F
    .locals 6

    iget-boolean v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mTriggerBack:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mInitTouchX:F

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mStartThresholdX:F

    :goto_0
    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v0, p0, Lcom/android/wm/shell/back/TouchTracker;->mLinearDistance:F

    iget v1, p0, Lcom/android/wm/shell/back/TouchTracker;->mMaxDistance:F

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    const/high16 v4, 0x3f800000    # 1.0f

    if-nez v3, :cond_1

    move v1, v4

    :cond_1
    cmpg-float v3, v0, v1

    if-gez v3, :cond_4

    sub-float v3, v1, v0

    iget p0, p0, Lcom/android/wm/shell/back/TouchTracker;->mNonLinearFactor:F

    mul-float/2addr p0, v3

    add-float/2addr p0, v0

    cmpg-float v5, p1, v0

    if-gtz v5, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    if-eqz v5, :cond_3

    goto :goto_2

    :cond_3
    sub-float v0, p1, v0

    div-float/2addr v0, v3

    invoke-static {p0, v1, v0}, Landroid/util/MathUtils;->lerp(FFF)F

    move-result p0

    :goto_2
    div-float/2addr p1, p0

    goto :goto_3

    :cond_4
    div-float/2addr p1, v1

    :goto_3
    invoke-static {p1, v2, v4}, Landroid/util/MathUtils;->constrain(FFF)F

    move-result p0

    return p0
.end method
