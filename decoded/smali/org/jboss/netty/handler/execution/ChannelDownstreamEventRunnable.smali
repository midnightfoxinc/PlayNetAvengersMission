.class public Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;
.super Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
.source "ChannelDownstreamEventRunnable.java"


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/util/concurrent/Executor;)V

    .line 31
    return-void
.end method


# virtual methods
.method protected doRun()V
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v1, p0, Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;->e:Lorg/jboss/netty/channel/ChannelEvent;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 39
    return-void
.end method
