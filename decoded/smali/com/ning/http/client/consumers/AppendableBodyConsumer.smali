.class public Lcom/ning/http/client/consumers/AppendableBodyConsumer;
.super Ljava/lang/Object;
.source "AppendableBodyConsumer.java"

# interfaces
.implements Lcom/ning/http/client/BodyConsumer;


# instance fields
.field private final appendable:Ljava/lang/Appendable;

.field private final encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Appendable;)V
    .locals 1
    .param p1, "appendable"    # Ljava/lang/Appendable;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->appendable:Ljava/lang/Appendable;

    .line 38
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->encoding:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;Ljava/lang/String;)V
    .locals 0
    .param p1, "appendable"    # Ljava/lang/Appendable;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->appendable:Ljava/lang/Appendable;

    .line 33
    iput-object p2, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->encoding:Ljava/lang/String;

    .line 34
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->appendable:Ljava/lang/Appendable;

    instance-of v0, v0, Ljava/io/Closeable;

    if-eqz v0, :cond_0

    .line 52
    const-class v0, Ljava/io/Closeable;

    iget-object v1, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->appendable:Ljava/lang/Appendable;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 54
    :cond_0
    return-void
.end method

.method public consume(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->appendable:Ljava/lang/Appendable;

    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    iget-object v5, p0, Lcom/ning/http/client/consumers/AppendableBodyConsumer;->encoding:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 47
    return-void
.end method
