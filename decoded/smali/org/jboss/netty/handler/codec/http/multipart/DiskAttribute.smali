.class public Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;
.super Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;
.source "DiskAttribute.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/Attribute;


# static fields
.field public static baseDirectory:Ljava/lang/String; = null

.field public static deleteOnExitTemporaryFile:Z = false

.field public static final postfix:Ljava/lang/String; = ".att"

.field public static final prefix:Ljava/lang/String; = "Attr_"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    sput-boolean v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->deleteOnExitTemporaryFile:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    const-wide/16 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    const-wide/16 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 44
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->setValue(Ljava/lang/String;)V

    .line 45
    return-void
.end method


# virtual methods
.method public addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    .locals 8
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 72
    .local v0, "localsize":I
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->size:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->checkSize(J)V

    .line 73
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->definedSize:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->definedSize:J

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->size:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 74
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->size:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->definedSize:J

    .line 76
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 77
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 27
    check-cast p1, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/Attribute;)I
    .locals 2
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I
    .locals 3
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 93
    instance-of v0, p1, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot compare "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_0
    check-cast p1, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .end local p1    # "o":Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/Attribute;)I

    move-result v0

    return v0
.end method

.method protected deleteOnExit()Z
    .locals 1

    .prologue
    .line 115
    sget-boolean v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->deleteOnExitTemporaryFile:Z

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 85
    instance-of v1, p1, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-nez v1, :cond_0

    .line 86
    const/4 v1, 0x0

    .line 89
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 88
    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 89
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method protected getBaseDirectory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->baseDirectory:Ljava/lang/String;

    return-object v0
.end method

.method protected getDiskFilename()Ljava/lang/String;
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".att"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;->Attribute:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    return-object v0
.end method

.method protected getPostfix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    const-string v0, ".att"

    return-object v0
.end method

.method protected getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    const-string v0, "Attr_"

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->get()[B

    move-result-object v0

    .line 53
    .local v0, "bytes":[B
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 6
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    if-nez p1, :cond_0

    .line 58
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "value"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 60
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 61
    .local v1, "bytes":[B
    array-length v2, v1

    int-to-long v2, v2

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->checkSize(J)V

    .line 62
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 63
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->definedSize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 64
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    int-to-long v2, v2

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->definedSize:J

    .line 66
    :cond_1
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 67
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 107
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 109
    :goto_0
    return-object v1

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=IoException"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
