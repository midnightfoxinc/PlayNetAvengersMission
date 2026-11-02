.class Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;
.super Ljava/lang/Object;
.source "ConnectionManager.java"

# interfaces
.implements Lorg/glassfish/grizzly/Connection$CloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/ConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConnectionMonitor"
.end annotation


# instance fields
.field private final connections:Ljava/util/concurrent/Semaphore;


# direct methods
.method constructor <init>(I)V
    .locals 1
    .param p1, "maxConnections"    # I

    .prologue
    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 257
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 258
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, p1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    .line 262
    :goto_0
    return-void

    .line 260
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    goto :goto_0
.end method


# virtual methods
.method public acquire()Z
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onClosed(Lorg/glassfish/grizzly/Closeable;Lorg/glassfish/grizzly/ICloseType;)V
    .locals 0
    .param p1, "x0"    # Lorg/glassfish/grizzly/Closeable;
    .param p2, "x1"    # Lorg/glassfish/grizzly/ICloseType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Lorg/glassfish/grizzly/Closeable;
    check-cast p2, Lorg/glassfish/grizzly/Connection$CloseType;

    .end local p2    # "x1":Lorg/glassfish/grizzly/ICloseType;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->onClosed(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/Connection$CloseType;)V

    return-void
.end method

.method public onClosed(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/Connection$CloseType;)V
    .locals 1
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "closeType"    # Lorg/glassfish/grizzly/Connection$CloseType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->connections:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 274
    :cond_0
    return-void
.end method
