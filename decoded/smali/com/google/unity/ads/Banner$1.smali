.class Lcom/google/unity/ads/Banner$1;
.super Ljava/lang/Object;
.source "Banner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/unity/ads/Banner;->create(Ljava/lang/String;Lcom/google/android/gms/ads/AdSize;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/unity/ads/Banner;

.field private final synthetic val$adSize:Lcom/google/android/gms/ads/AdSize;

.field private final synthetic val$positionCode:I

.field private final synthetic val$publisherId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/unity/ads/Banner;Ljava/lang/String;Lcom/google/android/gms/ads/AdSize;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    iput-object p2, p0, Lcom/google/unity/ads/Banner$1;->val$publisherId:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/unity/ads/Banner$1;->val$adSize:Lcom/google/android/gms/ads/AdSize;

    iput p4, p0, Lcom/google/unity/ads/Banner$1;->val$positionCode:I

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 60
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    new-instance v2, Lcom/google/android/gms/ads/AdView;

    iget-object v3, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v3}, Lcom/google/unity/ads/Banner;->access$0(Lcom/google/unity/ads/Banner;)Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lcom/google/unity/ads/Banner;->access$1(Lcom/google/unity/ads/Banner;Lcom/google/android/gms/ads/AdView;)V

    .line 62
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v1}, Lcom/google/unity/ads/Banner;->access$2(Lcom/google/unity/ads/Banner;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/AdView;->setBackgroundColor(I)V

    .line 63
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v1}, Lcom/google/unity/ads/Banner;->access$2(Lcom/google/unity/ads/Banner;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    iget-object v2, p0, Lcom/google/unity/ads/Banner$1;->val$publisherId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/AdView;->setAdUnitId(Ljava/lang/String;)V

    .line 64
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v1}, Lcom/google/unity/ads/Banner;->access$2(Lcom/google/unity/ads/Banner;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    iget-object v2, p0, Lcom/google/unity/ads/Banner$1;->val$adSize:Lcom/google/android/gms/ads/AdSize;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/AdView;->setAdSize(Lcom/google/android/gms/ads/AdSize;)V

    .line 65
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v1}, Lcom/google/unity/ads/Banner;->access$2(Lcom/google/unity/ads/Banner;)Lcom/google/android/gms/ads/AdView;

    move-result-object v1

    new-instance v2, Lcom/google/unity/ads/Banner$1$1;

    invoke-direct {v2, p0}, Lcom/google/unity/ads/Banner$1$1;-><init>(Lcom/google/unity/ads/Banner$1;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/AdView;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 101
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 102
    const/4 v1, -0x1

    const/4 v2, -0x2

    .line 101
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 103
    .local v0, "adParams":Landroid/widget/FrameLayout$LayoutParams;
    iget v1, p0, Lcom/google/unity/ads/Banner$1;->val$positionCode:I

    packed-switch v1, :pswitch_data_0

    .line 111
    :goto_0
    iget-object v1, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v1}, Lcom/google/unity/ads/Banner;->access$0(Lcom/google/unity/ads/Banner;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/google/unity/ads/Banner$1;->this$0:Lcom/google/unity/ads/Banner;

    invoke-static {v2}, Lcom/google/unity/ads/Banner;->access$2(Lcom/google/unity/ads/Banner;)Lcom/google/android/gms/ads/AdView;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    return-void

    .line 105
    :pswitch_0
    const/16 v1, 0x30

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_0

    .line 108
    :pswitch_1
    const/16 v1, 0x50

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    goto :goto_0

    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
