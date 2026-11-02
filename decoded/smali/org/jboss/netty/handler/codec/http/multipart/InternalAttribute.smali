.class public Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
.super Ljava/lang/Object;
.source "InternalAttribute.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field protected final value:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    .line 36
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->charset:Ljava/nio/charset/Charset;

    .line 37
    return-void
.end method


# virtual methods
.method public addValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 44
    if-nez p1, :cond_0

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method public addValue(Ljava/lang/String;I)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "rank"    # I

    .prologue
    .line 51
    if-nez p1, :cond_0

    .line 52
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v0, p2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 55
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I
    .locals 3
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 79
    instance-of v0, p1, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot compare "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

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

    .line 83
    :cond_0
    check-cast p1, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    .end local p1    # "o":Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;)I
    .locals 2
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 71
    instance-of v1, p1, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-nez v1, :cond_0

    .line 72
    const/4 v1, 0x0

    .line 75
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 74
    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 75
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;->InternalAttribute:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    const-string v0, "InternalAttribute"

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public setValue(Ljava/lang/String;I)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "rank"    # I

    .prologue
    .line 58
    if-nez p1, :cond_0

    .line 59
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v0, p2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public size()I
    .locals 5

    .prologue
    .line 91
    const/4 v3, 0x0

    .line 92
    .local v3, "size":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 94
    .local v1, "elt":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v4, v4
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v3, v4

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 99
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v1    # "elt":Ljava/lang/String;
    :cond_0
    return v3
.end method

.method public toChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4

    .prologue
    .line 111
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 112
    .local v0, "buffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 113
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->charset:Ljava/nio/charset/Charset;

    invoke-static {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 115
    :cond_0
    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .local v2, "result":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->value:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 105
    .local v0, "elt":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 107
    .end local v0    # "elt":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
