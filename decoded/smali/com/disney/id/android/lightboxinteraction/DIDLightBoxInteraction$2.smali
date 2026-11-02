.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$2;
.super Ljava/lang/Object;
.source "DIDLightBoxInteraction.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->requestLightBoxPageData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V
    .locals 0

    .prologue
    .line 185
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 188
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "The request did not complete successfully."

    invoke-static {v0, v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 189
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$2;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$500(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->allowContextSwitch()V

    .line 190
    return-void
.end method
