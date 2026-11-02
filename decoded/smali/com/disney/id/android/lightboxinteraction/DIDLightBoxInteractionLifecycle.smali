.class public Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;
.super Ljava/lang/Object;
.source "DIDLightBoxInteractionLifecycle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$1;,
        Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$DIDLightBoxInteractionFatoryLoader;
    }
.end annotation


# instance fields
.field private cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

.field private lightBoxInteractionStatus:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionStatus;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$1;

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle$DIDLightBoxInteractionFatoryLoader;->LOADER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    return-object v0
.end method


# virtual methods
.method public getCachedLightBoxInteraction()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    return-object v0
.end method

.method public getCachedLightBoxInteraction(Landroid/content/Context;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-nez v0, :cond_0

    .line 38
    const-string v0, "PRELOAD_INFO"

    const-string v1, "The cache needs to be initialized before normal usage."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->initializeCache(Landroid/content/Context;)V

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->updateContext(Landroid/content/Context;)V

    .line 44
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    return-object v0
.end method

.method public getLightBoxInteractionStatus()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionStatus;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->lightBoxInteractionStatus:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionStatus;

    return-object v0
.end method

    .method public initializeCache(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public refreshCache()V
    .locals 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-nez v0, :cond_0

    .line 22
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Refresh failed, the cache needs to be initialized before normal usage!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    :goto_0
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->triggerWebViewLoad()V

    goto :goto_0
.end method

.method public resetCache()V
    .locals 2

    .prologue
    .line 30
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Cached LB Interaction was reset."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->cleanUp()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->cachedLightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .line 33
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDNullLightBoxInteractionStatus;

    invoke-direct {v0}, Lcom/disney/id/android/lightboxinteraction/DIDNullLightBoxInteractionStatus;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->lightBoxInteractionStatus:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionStatus;

    .line 34
    return-void
.end method
