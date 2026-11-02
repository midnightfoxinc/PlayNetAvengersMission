.class Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"

# interfaces
.implements Lorg/glassfish/grizzly/CloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/glassfish/grizzly/CloseListener",
        "<",
        "Lorg/glassfish/grizzly/Connection;",
        "Lorg/glassfish/grizzly/CloseType;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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
    .line 68
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Lorg/glassfish/grizzly/Closeable;
    check-cast p2, Lorg/glassfish/grizzly/CloseType;

    .end local p2    # "x1":Lorg/glassfish/grizzly/ICloseType;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;->onClosed(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/CloseType;)V

    return-void
.end method

.method public onClosed(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/CloseType;)V
    .locals 3
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "closeType"    # Lorg/glassfish/grizzly/CloseType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    sget-object v0, Lorg/glassfish/grizzly/CloseType;->REMOTELY:Lorg/glassfish/grizzly/CloseType;

    if-ne p2, v0, :cond_0

    .line 72
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->access$000()Lorg/slf4j/Logger;

    move-result-object v0

    invoke-interface {v0}, Lorg/slf4j/Logger;->isInfoEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->access$000()Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "Remote closed connection ({}).  Removing from cache"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->removeAll(Lorg/glassfish/grizzly/Connection;)Z

    .line 78
    return-void
.end method
