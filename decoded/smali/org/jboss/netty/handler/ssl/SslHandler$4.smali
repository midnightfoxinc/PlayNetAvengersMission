.class Lorg/jboss/netty/handler/ssl/SslHandler$4;
.super Ljava/lang/Object;
.source "SslHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/ssl/SslHandler;->closeOutboundAndChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

.field final synthetic val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic val$e:Lorg/jboss/netty/channel/ChannelStateEvent;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0

    .prologue
    .line 1470
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$4;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/SslHandler$4;->val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iput-object p3, p0, Lorg/jboss/netty/handler/ssl/SslHandler$4;->val$e:Lorg/jboss/netty/channel/ChannelStateEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1472
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler$4;->val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$4;->val$e:Lorg/jboss/netty/channel/ChannelStateEvent;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 1473
    return-void
.end method
