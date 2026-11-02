.class public Lcom/ning/http/client/multipart/MultipartBody;
.super Ljava/lang/Object;
.source "MultipartBody.java"

# interfaces
.implements Lcom/ning/http/client/RandomAccessBody;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/multipart/MultipartBody$1;,
        Lcom/ning/http/client/multipart/MultipartBody$FileLocation;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final boundary:[B

.field private final contentLength:J

.field private final contentType:Ljava/lang/String;

.field private currentBytes:[B

.field private currentBytesPosition:I

.field private currentFileChannel:Ljava/nio/channels/FileChannel;

.field private currentPart:I

.field private doneWritingParts:Z

.field private fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingOpenFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/RandomAccessFile;",
            ">;"
        }
    .end annotation
.end field

.field private transfertDone:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/ning/http/client/multipart/MultipartBody;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/MultipartBody;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;J[B)V
    .locals 3
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "contentLength"    # J
    .param p5, "boundary"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;",
            "Ljava/lang/String;",
            "J[B)V"
        }
    .end annotation

    .prologue
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    .line 38
    iput-boolean v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->transfertDone:Z

    .line 40
    iput v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    .line 43
    iput-boolean v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->doneWritingParts:Z

    .line 44
    sget-object v0, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->NONE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    iput-object v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    .line 52
    iput-object p5, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    .line 53
    iput-wide p3, p0, Lcom/ning/http/client/multipart/MultipartBody;->contentLength:J

    .line 54
    iput-object p2, p0, Lcom/ning/http/client/multipart/MultipartBody;->contentType:Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    .line 56
    return-void
.end method

.method private currentBytesFullyRead()Z
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    iget-object v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    if-lt v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initializeCurrentBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    iput-object p1, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    .line 206
    const/4 v0, 0x0

    iput v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    .line 207
    return-void
.end method

.method private initializeFileBody(Lcom/ning/http/client/multipart/AbstractFilePart;)V
    .locals 3
    .param p1, "part"    # Lcom/ning/http/client/multipart/AbstractFilePart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    instance-of v1, p1, Lcom/ning/http/client/multipart/FilePart;

    if-eqz v1, :cond_0

    .line 192
    new-instance v0, Ljava/io/RandomAccessFile;

    const-class v1, Lcom/ning/http/client/multipart/FilePart;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/multipart/FilePart;

    invoke-virtual {v1}, Lcom/ning/http/client/multipart/FilePart;->getFile()Ljava/io/File;

    move-result-object v1

    const-string v2, "r"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 193
    .local v0, "raf":Ljava/io/RandomAccessFile;
    iget-object v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    .line 202
    .end local v0    # "raf":Ljava/io/RandomAccessFile;
    :goto_0
    return-void

    .line 196
    :cond_0
    instance-of v1, p1, Lcom/ning/http/client/multipart/ByteArrayPart;

    if-eqz v1, :cond_1

    .line 197
    const-class v1, Lcom/ning/http/client/multipart/ByteArrayPart;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/multipart/ByteArrayPart;

    invoke-virtual {v1}, Lcom/ning/http/client/multipart/ByteArrayPart;->getBytes()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/multipart/MultipartBody;->initializeCurrentBytes([B)V

    goto :goto_0

    .line 200
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unknow AbstractFilePart type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private writeCurrentBytes(Ljava/nio/ByteBuffer;I)I
    .locals 4
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    array-length v2, v2

    iget v3, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    sub-int v0, v2, v3

    .line 230
    .local v0, "available":I
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 232
    .local v1, "writeLength":I
    if-lez v1, :cond_0

    .line 233
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    iget v3, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 235
    if-gt v0, p2, :cond_1

    .line 236
    const/4 v2, -0x1

    iput v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    .line 237
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    .line 243
    :cond_0
    :goto_0
    return v1

    .line 239
    :cond_1
    iget v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    goto :goto_0
.end method

.method private writeCurrentFile(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2, p1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 213
    .local v1, "read":I
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v2

    iget-object v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 215
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V

    .line 216
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    .line 218
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 219
    .local v0, "currentFile":I
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    .line 220
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 223
    .end local v0    # "currentFile":I
    :cond_0
    return v1
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v2, p0, Lcom/ning/http/client/multipart/MultipartBody;->pendingOpenFiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/RandomAccessFile;

    .line 60
    .local v0, "file":Ljava/io/RandomAccessFile;
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    goto :goto_0

    .line 62
    .end local v0    # "file":Ljava/io/RandomAccessFile;
    :cond_0
    return-void
.end method

.method public getBoundary()[B
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 65
    iget-wide v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->contentLength:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/ning/http/client/multipart/MultipartBody;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public read(Ljava/nio/ByteBuffer;)J
    .locals 14
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v13, -0x1

    const/4 v9, 0x1

    .line 99
    const/4 v6, 0x0

    .line 101
    .local v6, "overallLength":I
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 103
    .local v5, "maxLength":I
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    iget-object v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ne v11, v12, :cond_0

    iget-boolean v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->transfertDone:Z

    if-eqz v11, :cond_0

    .line 104
    const-wide/16 v10, -0x1

    .line 181
    .end local v5    # "maxLength":I
    :goto_0
    return-wide v10

    .line 107
    .restart local v5    # "maxLength":I
    :cond_0
    const/4 v4, 0x0

    .line 109
    .local v4, "full":Z
    :cond_1
    :goto_1
    if-nez v4, :cond_8

    iget-boolean v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->doneWritingParts:Z

    if-nez v11, :cond_8

    .line 110
    const/4 v7, 0x0

    .line 112
    .local v7, "part":Lcom/ning/http/client/multipart/Part;
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    iget-object v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ge v11, v12, :cond_2

    .line 113
    iget-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    iget v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "part":Lcom/ning/http/client/multipart/Part;
    check-cast v7, Lcom/ning/http/client/multipart/Part;

    .line 115
    .restart local v7    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_2
    iget-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentFileChannel:Ljava/nio/channels/FileChannel;

    if-eqz v11, :cond_4

    .line 116
    invoke-direct {p0, p1}, Lcom/ning/http/client/multipart/MultipartBody;->writeCurrentFile(Ljava/nio/ByteBuffer;)I

    move-result v11

    add-int/2addr v6, v11

    .line 117
    if-ne v6, v5, :cond_3

    move v4, v9

    :goto_2
    goto :goto_1

    :cond_3
    move v4, v10

    goto :goto_2

    .line 119
    :cond_4
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    if-le v11, v13, :cond_6

    .line 120
    sub-int v11, v5, v6

    invoke-direct {p0, p1, v11}, Lcom/ning/http/client/multipart/MultipartBody;->writeCurrentBytes(Ljava/nio/ByteBuffer;I)I

    move-result v11

    add-int/2addr v6, v11

    .line 121
    if-ne v6, v5, :cond_5

    move v4, v9

    .line 123
    :goto_3
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    iget-object v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ne v11, v12, :cond_1

    invoke-direct {p0}, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesFullyRead()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 124
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->doneWritingParts:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 179
    .end local v4    # "full":Z
    .end local v5    # "maxLength":I
    .end local v7    # "part":Lcom/ning/http/client/multipart/Part;
    :catch_0
    move-exception v2

    .line 180
    .local v2, "e":Ljava/lang/Exception;
    sget-object v9, Lcom/ning/http/client/multipart/MultipartBody;->LOGGER:Lorg/slf4j/Logger;

    const-string v10, "Read exception"

    invoke-interface {v9, v10, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 181
    const-wide/16 v10, 0x0

    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v4    # "full":Z
    .restart local v5    # "maxLength":I
    .restart local v7    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_5
    move v4, v10

    .line 121
    goto :goto_3

    .line 127
    :cond_6
    :try_start_1
    instance-of v11, v7, Lcom/ning/http/client/multipart/StringPart;

    if-eqz v11, :cond_7

    .line 128
    move-object v0, v7

    check-cast v0, Lcom/ning/http/client/multipart/StringPart;

    move-object v8, v0

    .line 130
    .local v8, "stringPart":Lcom/ning/http/client/multipart/StringPart;
    iget-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    invoke-virtual {v8, v11}, Lcom/ning/http/client/multipart/StringPart;->getBytes([B)[B

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/ning/http/client/multipart/MultipartBody;->initializeCurrentBytes([B)V

    .line 131
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    add-int/lit8 v11, v11, 0x1

    iput v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    goto :goto_1

    .line 133
    .end local v8    # "stringPart":Lcom/ning/http/client/multipart/StringPart;
    :cond_7
    instance-of v11, v7, Lcom/ning/http/client/multipart/AbstractFilePart;

    if-eqz v11, :cond_1

    .line 135
    move-object v0, v7

    check-cast v0, Lcom/ning/http/client/multipart/AbstractFilePart;

    move-object v3, v0

    .line 137
    .local v3, "filePart":Lcom/ning/http/client/multipart/AbstractFilePart;
    sget-object v11, Lcom/ning/http/client/multipart/MultipartBody$1;->$SwitchMap$com$ning$http$client$multipart$MultipartBody$FileLocation:[I

    iget-object v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    invoke-virtual {v12}, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->ordinal()I

    move-result v12

    aget v11, v11, v12

    packed-switch v11, :pswitch_data_0

    goto/16 :goto_1

    .line 140
    :pswitch_0
    iget-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    invoke-virtual {v3, v11}, Lcom/ning/http/client/multipart/AbstractFilePart;->generateFileStart([B)[B

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/ning/http/client/multipart/MultipartBody;->initializeCurrentBytes([B)V

    .line 141
    sget-object v11, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->START:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    iput-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    goto/16 :goto_1

    .line 145
    :pswitch_1
    invoke-direct {p0, v3}, Lcom/ning/http/client/multipart/MultipartBody;->initializeFileBody(Lcom/ning/http/client/multipart/AbstractFilePart;)V

    .line 146
    sget-object v11, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->MIDDLE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    iput-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    goto/16 :goto_1

    .line 149
    :pswitch_2
    invoke-virtual {v3}, Lcom/ning/http/client/multipart/AbstractFilePart;->generateFileEnd()[B

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/ning/http/client/multipart/MultipartBody;->initializeCurrentBytes([B)V

    .line 150
    sget-object v11, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->END:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    iput-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    goto/16 :goto_1

    .line 153
    :pswitch_3
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    add-int/lit8 v11, v11, 0x1

    iput v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    .line 154
    sget-object v11, Lcom/ning/http/client/multipart/MultipartBody$FileLocation;->NONE:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    iput-object v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->fileLocation:Lcom/ning/http/client/multipart/MultipartBody$FileLocation;

    .line 155
    iget v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentPart:I

    iget-object v12, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-ne v11, v12, :cond_1

    .line 156
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/ning/http/client/multipart/MultipartBody;->doneWritingParts:Z

    goto/16 :goto_1

    .line 162
    .end local v3    # "filePart":Lcom/ning/http/client/multipart/AbstractFilePart;
    .end local v7    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_8
    iget-boolean v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->doneWritingParts:Z

    if-eqz v9, :cond_a

    .line 163
    iget v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    if-ne v9, v13, :cond_9

    .line 164
    iget-object v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    invoke-static {v9}, Lcom/ning/http/client/multipart/MultipartUtils;->getMessageEnd([B)[B

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/ning/http/client/multipart/MultipartBody;->initializeCurrentBytes([B)V

    .line 167
    :cond_9
    iget v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    if-le v9, v13, :cond_a

    .line 168
    sub-int v9, v5, v6

    invoke-direct {p0, p1, v9}, Lcom/ning/http/client/multipart/MultipartBody;->writeCurrentBytes(Ljava/nio/ByteBuffer;I)I

    move-result v9

    add-int/2addr v6, v9

    .line 170
    invoke-direct {p0}, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesFullyRead()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 171
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytes:[B

    .line 172
    const/4 v9, -0x1

    iput v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->currentBytesPosition:I

    .line 173
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/ning/http/client/multipart/MultipartBody;->transfertDone:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 177
    :cond_a
    int-to-long v10, v6

    goto/16 :goto_0

    .line 137
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public transferTo(JLjava/nio/channels/WritableByteChannel;)J
    .locals 6
    .param p1, "position"    # J
    .param p3, "target"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    const-wide/16 v2, 0x0

    .line 81
    .local v2, "overallLength":J
    iget-boolean v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->transfertDone:Z

    if-eqz v4, :cond_0

    .line 82
    iget-wide v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->contentLength:J

    .line 93
    :goto_0
    return-wide v4

    .line 85
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->parts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/multipart/Part;

    .line 86
    .local v1, "part":Lcom/ning/http/client/multipart/Part;
    iget-object v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    invoke-interface {v1, p3, v4}, Lcom/ning/http/client/multipart/Part;->write(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 87
    goto :goto_1

    .line 89
    .end local v1    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_1
    iget-object v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->boundary:[B

    invoke-static {v4}, Lcom/ning/http/client/multipart/MultipartUtils;->getMessageEnd([B)[B

    move-result-object v4

    invoke-static {p3, v4}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 91
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/ning/http/client/multipart/MultipartBody;->transfertDone:Z

    move-wide v4, v2

    .line 93
    goto :goto_0
.end method
