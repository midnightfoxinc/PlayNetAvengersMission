.class final Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/Body;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EmptyBody"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V
    .locals 0

    .prologue
    .line 232
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;

    .prologue
    .line 232
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 246
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->completeAndRecycle()V

    .line 247
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0, v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$302(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/filterchain/FilterChainContext;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .line 248
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0, v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$402(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Lorg/glassfish/grizzly/http/HttpRequestPacket;

    .line 249
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$EmptyBody;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0, v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$502(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;Lorg/glassfish/grizzly/http/HttpContent$Builder;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    .line 250
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 236
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public read(Ljava/nio/ByteBuffer;)J
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    const-wide/16 v0, 0x0

    return-wide v0
.end method
