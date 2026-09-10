.class public Lcom/android/keyguard/taboola/SwipeHintView;
.super Landroid/widget/FrameLayout;
.source "go/retraceme 99bb965a40b05feef6ba43b5089f9d62fc4f0b137f243b0f0564e64d90932134"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mCircleDimenPx:I

.field public mFullLayoutExpansionPx:I

.field public mIsRunning:Z

.field public mSwipeCircleIV:Landroid/widget/ImageView;

.field public swipeHintViewOrientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mIsRunning:Z

    invoke-virtual {p0}, Lcom/android/keyguard/taboola/SwipeHintView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mIsRunning:Z

    invoke-virtual {p0}, Lcom/android/keyguard/taboola/SwipeHintView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mIsRunning:Z

    invoke-virtual {p0}, Lcom/android/keyguard/taboola/SwipeHintView;->init()V

    return-void
.end method


# virtual methods
.method public final animateResize(ZLcom/android/keyguard/taboola/SwipeHintView$$ExternalSyntheticLambda0;)V
    .locals 11

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    move v3, v0

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    if-eqz p1, :cond_1

    move v4, v1

    goto :goto_1

    :cond_1
    move v4, v0

    :goto_1
    if-eqz p1, :cond_2

    move v5, v0

    goto :goto_2

    :cond_2
    move v5, v1

    :goto_2
    if-eqz p1, :cond_3

    move v6, v1

    goto :goto_3

    :cond_3
    move v6, v0

    :goto_3
    new-instance p1, Landroid/view/animation/ScaleAnimation;

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    move-object v2, p1

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/animation/ScaleAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/animation/ScaleAnimation;->setFillEnabled(Z)V

    invoke-virtual {p1, v0}, Landroid/view/animation/ScaleAnimation;->setFillAfter(Z)V

    new-instance v0, Lcom/android/keyguard/taboola/SwipeHintView$2;

    invoke-direct {v0, p2}, Lcom/android/keyguard/taboola/SwipeHintView$2;-><init>(Lcom/android/keyguard/taboola/SwipeHintView$$ExternalSyntheticLambda0;)V

    invoke-virtual {p1, v0}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object p0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mSwipeCircleIV:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public final animateStart()V
    .locals 6

    iget-object v0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mSwipeCircleIV:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget v1, p0, Lcom/android/keyguard/taboola/SwipeHintView;->swipeHintViewOrientation:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, -0x1

    if-eq v1, v3, :cond_2

    const/4 v5, 0x2

    if-eq v1, v5, :cond_1

    const/4 v5, 0x3

    if-eq v1, v5, :cond_0

    iput v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I

    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    goto :goto_0

    :cond_0
    iput v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I

    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_0

    :cond_1
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I

    iput v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->bottomToBottom:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_0

    :cond_2
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->startToStart:I

    iput v4, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->endToEnd:I

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    :goto_0
    iget-object v1, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mSwipeCircleIV:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lcom/android/keyguard/taboola/SwipeHintView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, v2}, Lcom/android/keyguard/taboola/SwipeHintView$$ExternalSyntheticLambda0;-><init>(Lcom/android/keyguard/taboola/SwipeHintView;I)V

    invoke-virtual {p0, v3, v0}, Lcom/android/keyguard/taboola/SwipeHintView;->animateResize(ZLcom/android/keyguard/taboola/SwipeHintView$$ExternalSyntheticLambda0;)V

    return-void
.end method

.method public final init()V
    .locals 2

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d02b9

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0735

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mSwipeCircleIV:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070953

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mCircleDimenPx:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070954

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->mFullLayoutExpansionPx:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/keyguard/taboola/SwipeHintView;->swipeHintViewOrientation:I

    return-void
.end method
