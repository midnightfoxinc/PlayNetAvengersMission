.class Lcom/disney/id/android/volley/toolbox/ImageLoader$3;
.super Ljava/lang/Object;
.source "ImageLoader.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/volley/toolbox/ImageLoader;->makeImageRequest(Ljava/lang/String;IILandroid/widget/ImageView$ScaleType;Ljava/lang/String;)Lcom/disney/id/android/volley/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/volley/toolbox/ImageLoader;

.field final synthetic val$cacheKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/disney/id/android/volley/toolbox/ImageLoader;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 257
    iput-object p1, p0, Lcom/disney/id/android/volley/toolbox/ImageLoader$3;->this$0:Lcom/disney/id/android/volley/toolbox/ImageLoader;

    iput-object p2, p0, Lcom/disney/id/android/volley/toolbox/ImageLoader$3;->val$cacheKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/disney/id/android/volley/toolbox/ImageLoader$3;->this$0:Lcom/disney/id/android/volley/toolbox/ImageLoader;

    iget-object v1, p0, Lcom/disney/id/android/volley/toolbox/ImageLoader$3;->val$cacheKey:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/disney/id/android/volley/toolbox/ImageLoader;->onGetImageError(Ljava/lang/String;Lcom/disney/id/android/volley/VolleyError;)V

    .line 261
    return-void
.end method
