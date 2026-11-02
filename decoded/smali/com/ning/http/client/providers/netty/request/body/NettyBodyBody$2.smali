.class Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$2;
.super Lcom/ning/http/client/providers/netty/request/ProgressListener;
.source "NettyBodyBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)V
    .locals 0
    .param p2, "x0"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p5, "x3"    # Z

    .prologue
    .line 79
    .local p3, "x1":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    .local p4, "x2":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$2;->this$0:Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/ning/http/client/providers/netty/request/ProgressListener;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 1
    .param p1, "cf"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$2;->this$0:Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->access$000(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;)Lcom/ning/http/client/Body;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 82
    invoke-super {p0, p1}, Lcom/ning/http/client/providers/netty/request/ProgressListener;->operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 83
    return-void
.end method
