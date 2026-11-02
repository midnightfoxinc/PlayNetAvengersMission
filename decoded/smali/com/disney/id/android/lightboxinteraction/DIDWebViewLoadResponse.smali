.class Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;
.super Ljava/lang/Object;
.source "DIDWebViewLoadResponse.java"


# instance fields
.field private modified:Z

.field private payload:Ljava/lang/String;

.field private responseHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;Ljava/lang/String;Z)V
    .locals 0
    .param p2, "payload"    # Ljava/lang/String;
    .param p3, "modified"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p1, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->responseHeaders:Ljava/util/Map;

    .line 15
    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->payload:Ljava/lang/String;

    .line 16
    iput-boolean p3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->modified:Z

    .line 17
    return-void
.end method


# virtual methods
.method getPayload()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->payload:Ljava/lang/String;

    return-object v0
.end method

.method getResponseHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->responseHeaders:Ljava/util/Map;

    return-object v0
.end method

.method isModified()Z
    .locals 1

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;->modified:Z

    return v0
.end method
