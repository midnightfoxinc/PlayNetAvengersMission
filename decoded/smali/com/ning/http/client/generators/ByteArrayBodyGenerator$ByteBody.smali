.class public final Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;
.super Ljava/lang/Object;
.source "ByteArrayBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/Body;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/generators/ByteArrayBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ByteBody"
.end annotation


# instance fields
.field private eof:Z

.field private lastPosition:I

.field final synthetic this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;


# direct methods
.method protected constructor <init>(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    iput-object p1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-boolean v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->eof:Z

    .line 34
    iput v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    .line 63
    iput-boolean v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->eof:Z

    .line 64
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->access$000(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public read(Ljava/nio/ByteBuffer;)J
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-boolean v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->eof:Z

    if-eqz v1, :cond_0

    .line 45
    const-wide/16 v2, -0x1

    .line 56
    :goto_0
    return-wide v2

    .line 48
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->access$000(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)[B

    move-result-object v1

    array-length v1, v1

    iget v2, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    sub-int v0, v1, v2

    .line 49
    .local v0, "remaining":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 50
    iget-object v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->access$000(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)[B

    move-result-object v1

    iget v2, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 51
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->eof:Z

    .line 52
    int-to-long v2, v0

    goto :goto_0

    .line 54
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->this$0:Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->access$000(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)[B

    move-result-object v1

    iget v2, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    invoke-virtual {p1, v1, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 55
    iget v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;->lastPosition:I

    .line 56
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    int-to-long v2, v1

    goto :goto_0
.end method
