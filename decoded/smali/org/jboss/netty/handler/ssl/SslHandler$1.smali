.class Lorg/jboss/netty/handler/ssl/SslHandler$1;
.super Ljava/lang/Object;
.source "SslHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/ssl/SslHandler;->handshake()Lorg/jboss/netty/channel/ChannelFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

.field final synthetic val$channel:Lorg/jboss/netty/channel/Channel;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/Channel;)V
    .locals 0

    .prologue
    .line 366
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->val$channel:Lorg/jboss/netty/channel/Channel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 8
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 368
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$000(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 369
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->isDone()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 375
    :goto_0
    return-void

    .line 373
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->val$channel:Lorg/jboss/netty/channel/Channel;

    new-instance v3, Ljavax/net/ssl/SSLException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Handshake did not complete within "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/ssl/SslHandler$1;->this$0:Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v5}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$100(Lorg/jboss/netty/handler/ssl/SslHandler;)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->access$200(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V

    goto :goto_0
.end method
