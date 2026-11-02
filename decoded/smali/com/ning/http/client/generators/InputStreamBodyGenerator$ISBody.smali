.class public Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;
.super Ljava/lang/Object;
.source "InputStreamBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/Body;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/generators/InputStreamBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ISBody"
.end annotation


# instance fields
.field private chunk:[B

.field private endDataCount:I

.field private eof:Z

.field final synthetic this$0:Lcom/ning/http/client/generators/InputStreamBodyGenerator;


# direct methods
.method protected constructor <init>(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 54
    iput-object p1, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->this$0:Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-boolean v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->eof:Z

    .line 56
    iput v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->endDataCount:I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->this$0:Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$000(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 120
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 61
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
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 68
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    add-int/lit8 v2, v2, -0xa

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->chunk:[B

    .line 71
    const/4 v1, -0x1

    .line 73
    .local v1, "read":I
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->this$0:Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$000(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)Ljava/io/InputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->chunk:[B

    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 78
    :goto_0
    iget-object v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->this$0:Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$200(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 79
    const/4 v2, -0x1

    if-ne v1, v2, :cond_3

    .line 84
    iget-boolean v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->eof:Z

    if-nez v2, :cond_2

    .line 85
    iget v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->endDataCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->endDataCount:I

    .line 86
    iget v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->endDataCount:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 87
    iput-boolean v5, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->eof:Z

    .line 89
    :cond_0
    iget v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->endDataCount:I

    if-ne v2, v5, :cond_1

    .line 90
    invoke-static {}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$300()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 92
    :cond_1
    invoke-static {}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$400()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 94
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    int-to-long v2, v2

    .line 114
    :goto_1
    return-wide v2

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$100()Lorg/slf4j/Logger;

    move-result-object v2

    const-string v3, "Unable to read"

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 96
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_2
    iput-boolean v4, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->eof:Z

    .line 98
    const-wide/16 v2, -0x1

    goto :goto_1

    .line 105
    :cond_3
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 107
    invoke-static {}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$400()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 108
    iget-object v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->chunk:[B

    invoke-virtual {p1, v2, v4, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 110
    invoke-static {}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->access$400()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 114
    :cond_4
    :goto_2
    int-to-long v2, v1

    goto :goto_1

    .line 111
    :cond_5
    if-lez v1, :cond_4

    .line 112
    iget-object v2, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;->chunk:[B

    invoke-virtual {p1, v2, v4, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto :goto_2
.end method
