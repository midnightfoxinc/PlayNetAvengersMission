.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;
.super Ljava/lang/Object;
.source "DIDLightBoxInteraction.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->requestLightBoxPageData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/volley/Response$Listener",
        "<",
        "Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;


# direct methods
.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V
    .locals 0

    .prologue
    .line 171
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;)V
    .locals 4
    .param p1, "response"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$002(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/lang/Long;)Ljava/lang/Long;

    .line 175
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->getResponseHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$102(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/util/Map;)Ljava/util/Map;

    .line 176
    invoke-virtual {p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->isModified()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 177
    const-string v0, "PRELOAD_INFO"

    const-string v1, "The response was modified, need to reload page"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->getPayload()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$200(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/lang/String;)V

    .line 183
    :goto_0
    return-void

    .line 180
    :cond_0
    const-string v0, "PRELOAD_INFO"

    const-string v1, "A 304 was returned, we can safely reuse the existing page."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->reuseExistingPage()V

    goto :goto_0
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 171
    check-cast p1, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;->onResponse(Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;)V

    return-void
.end method
