.class final Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/Body;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PushBody"
.end annotation


# instance fields
.field private final CLOSING:I

.field private final FINISHED:I

.field private final ONGOING:I

.field private finishState:I

.field final synthetic this$0:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->this$0:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput v1, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->ONGOING:I

    .line 61
    const/4 v0, 0x1

    iput v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->CLOSING:I

    .line 62
    const/4 v0, 0x2

    iput v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->FINISHED:I

    .line 64
    iput v1, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->finishState:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;
    .param p2, "x1"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$1;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;-><init>(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 110
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 68
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public read(Ljava/nio/ByteBuffer;)J
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->this$0:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    invoke-static {v4}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$100(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;)Ljava/util/Queue;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;

    .line 74
    .local v2, "nextPart":Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;
    if-nez v2, :cond_0

    .line 76
    iget v4, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->finishState:I

    packed-switch v4, :pswitch_data_0

    .line 89
    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    add-int/lit8 v0, v4, -0xa

    .line 90
    .local v0, "capacity":I
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->access$400(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 91
    .local v3, "size":I
    if-eqz v3, :cond_2

    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 93
    invoke-static {}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$300()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 94
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 95
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->access$400(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "capacity":I
    .end local v1    # "i":I
    .end local v3    # "size":I
    :pswitch_0
    const-wide/16 v4, 0x0

    .line 105
    :goto_1
    return-wide v4

    .line 80
    :pswitch_1
    invoke-static {}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$200()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 81
    invoke-static {}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$300()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 82
    const/4 v4, 0x2

    iput v4, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->finishState:I

    .line 83
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    int-to-long v4, v4

    goto :goto_1

    .line 85
    :pswitch_2
    invoke-static {}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$300()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 86
    const-wide/16 v4, -0x1

    goto :goto_1

    .line 97
    .restart local v0    # "capacity":I
    .restart local v1    # "i":I
    .restart local v3    # "size":I
    :cond_1
    invoke-static {}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$300()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 99
    .end local v1    # "i":I
    :cond_2
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->access$400(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-nez v4, :cond_4

    .line 100
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;->access$500(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 101
    const/4 v4, 0x1

    iput v4, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->finishState:I

    .line 103
    :cond_3
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;->this$0:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    invoke-static {v4}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->access$100(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;)Ljava/util/Queue;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 105
    :cond_4
    int-to-long v4, v3

    goto :goto_1

    .line 76
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
