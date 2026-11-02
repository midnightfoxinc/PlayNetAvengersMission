.class Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;
.super Landroid/os/Handler;
.source "EmagineApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/app/EmagineApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ApplicationHandler"
.end annotation


# instance fields
.field private final mApplication:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/disney/emagine/app/EmagineApplication;",
            ">;"
        }
    .end annotation
.end field

.field private final mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/os/Handler$Callback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/disney/emagine/app/EmagineApplication;Landroid/os/Looper;)V
    .locals 1
    .param p1, "app"    # Lcom/disney/emagine/app/EmagineApplication;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 223
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 224
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mApplication:Ljava/lang/ref/WeakReference;

    .line 225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    .line 226
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 230
    iget-object v1, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mApplication:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 234
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 238
    iget-object v1, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler$Callback;

    .line 239
    .local v0, "cb":Landroid/os/Handler$Callback;
    invoke-interface {v0, p1}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0
.end method

.method public registerCallback(Landroid/os/Handler$Callback;)V
    .locals 1
    .param p1, "callback"    # Landroid/os/Handler$Callback;

    .prologue
    .line 257
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    :cond_0
    return-void
.end method

.method public unregisterCallback(Landroid/os/Handler$Callback;)Z
    .locals 1
    .param p1, "callback"    # Landroid/os/Handler$Callback;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->mCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
