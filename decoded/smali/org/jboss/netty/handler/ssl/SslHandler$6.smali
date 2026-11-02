.class Lorg/jboss/netty/handler/ssl/SslHandler$6;
.super Ljava/lang/Object;
.source "SslHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/ssl/SslHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

.field final synthetic val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0

    .prologue
    .line 1615
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 1617
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$400(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/util/internal/NonReentrantLock;->tryLock()Z

    move-result v7

    if-nez v7, :cond_1

    .line 1656
    :cond_0
    :goto_0
    return-void

    .line 1621
    :cond_1
    const/4 v2, 0x0

    .local v2, "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    move-object v3, v2

    .line 1624
    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .local v3, "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :goto_1
    :try_start_0
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$500(Lorg/jboss/netty/handler/ssl/SslHandler;)Ljava/util/Queue;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;

    .line 1625
    .local v5, "pw":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    if-nez v5, :cond_2

    .line 1635
    :goto_2
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$600(Lorg/jboss/netty/handler/ssl/SslHandler;)Ljava/util/Queue;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1636
    .local v1, "ev":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v1, :cond_3

    .line 1645
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$400(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1648
    if-eqz v3, :cond_0

    .line 1649
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 1650
    .local v0, "cause":Ljava/nio/channels/ClosedChannelException;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    .line 1651
    .local v6, "size":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-ge v4, v6, :cond_4

    .line 1652
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v7, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 1651
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1628
    .end local v0    # "cause":Ljava/nio/channels/ClosedChannelException;
    .end local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .end local v4    # "i":I
    .end local v6    # "size":I
    :cond_2
    if-nez v3, :cond_6

    .line 1629
    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1631
    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :goto_4
    :try_start_2
    iget-object v7, v5, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v3, v2

    .line 1632
    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    goto :goto_1

    .line 1639
    .restart local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    :cond_3
    if-eqz v3, :cond_5

    .line 1640
    :try_start_3
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1642
    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :goto_5
    :try_start_4
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v3, v2

    .line 1643
    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    goto :goto_2

    .line 1645
    .end local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .end local v5    # "pw":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :catchall_0
    move-exception v7

    move-object v2, v3

    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :goto_6
    iget-object v8, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v8}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$400(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v7

    .line 1654
    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v0    # "cause":Ljava/nio/channels/ClosedChannelException;
    .restart local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v4    # "i":I
    .restart local v5    # "pw":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    .restart local v6    # "size":I
    :cond_4
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler$6;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v7, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1645
    .end local v0    # "cause":Ljava/nio/channels/ClosedChannelException;
    .end local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .end local v4    # "i":I
    .end local v6    # "size":I
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :catchall_1
    move-exception v7

    goto :goto_6

    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :cond_5
    move-object v2, v3

    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    goto :goto_5

    .end local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    .end local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    :cond_6
    move-object v2, v3

    .end local v3    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    .restart local v2    # "futures":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/channel/ChannelFuture;>;"
    goto :goto_4
.end method
