.class public abstract Lcom/ning/http/client/providers/netty/Callback;
.super Ljava/lang/Object;
.source "Callback.java"


# instance fields
.field private final future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/Callback;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 24
    return-void
.end method


# virtual methods
.method public abstract call()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public future()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/Callback;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    return-object v0
.end method
