.class Lcom/ning/http/client/providers/netty/channel/ChannelManager$6;
.super Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;
.source "ChannelManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpContentDecompressor()Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V
    .locals 0

    .prologue
    .line 275
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$6;->this$0:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;-><init>()V

    return-void
.end method


# virtual methods
.method protected getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1, "contentEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 278
    return-object p1
.end method
