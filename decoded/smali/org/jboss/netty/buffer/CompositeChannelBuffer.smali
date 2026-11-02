.class public Lorg/jboss/netty/buffer/CompositeChannelBuffer;
.super Lorg/jboss/netty/buffer/AbstractChannelBuffer;
.source "CompositeChannelBuffer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private components:[Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final gathering:Z

.field private indices:[I

.field private lastAccessedComponentId:I

.field private final order:Ljava/nio/ByteOrder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/nio/ByteOrder;Ljava/util/List;Z)V
    .locals 0
    .param p1, "endianness"    # Ljava/nio/ByteOrder;
    .param p3, "gathering"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteOrder;",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "buffers":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    invoke-direct {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order:Ljava/nio/ByteOrder;

    .line 46
    iput-boolean p3, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->gathering:Z

    .line 47
    invoke-direct {p0, p2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setComponents(Ljava/util/List;)V

    .line 48
    return-void
.end method

.method private constructor <init>(Lorg/jboss/netty/buffer/CompositeChannelBuffer;)V
    .locals 2
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    .prologue
    .line 141
    invoke-direct {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;-><init>()V

    .line 142
    iget-object v0, p1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order:Ljava/nio/ByteOrder;

    iput-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order:Ljava/nio/ByteOrder;

    .line 143
    iget-boolean v0, p1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->gathering:Z

    iput-boolean v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->gathering:Z

    .line 144
    iget-object v0, p1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v0}, [Lorg/jboss/netty/buffer/ChannelBuffer;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iput-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 145
    iget-object v0, p1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    .line 146
    invoke-virtual {p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->writerIndex()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setIndex(II)V

    .line 147
    return-void
.end method

.method private componentId(I)I
    .locals 5
    .param p1, "index"    # I

    .prologue
    .line 687
    iget v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->lastAccessedComponentId:I

    .line 688
    .local v1, "lastComponentId":I
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v1

    if-lt p1, v2, :cond_2

    .line 689
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v1, 0x1

    aget v2, v2, v3

    if-ge p1, v2, :cond_0

    move v0, v1

    .line 705
    :goto_0
    return v0

    .line 694
    :cond_0
    add-int/lit8 v0, v1, 0x1

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v2, v2

    if-ge v0, v2, :cond_4

    .line 695
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-ge p1, v2, :cond_1

    .line 696
    iput v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->lastAccessedComponentId:I

    goto :goto_0

    .line 694
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 702
    .end local v0    # "i":I
    :cond_2
    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_2
    if-ltz v0, :cond_4

    .line 703
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    if-lt p1, v2, :cond_3

    .line 704
    iput v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->lastAccessedComponentId:I

    goto :goto_0

    .line 702
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 710
    :cond_4
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", maximum: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private copyTo(IIILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "componentId"    # I
    .param p4, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 574
    const/4 v1, 0x0

    .line 575
    .local v1, "dstIndex":I
    move v2, p3

    .line 577
    .local v2, "i":I
    :goto_0
    if-lez p2, :cond_0

    .line 578
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v4, v5, v2

    .line 579
    .local v4, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v5, v2

    .line 580
    .local v0, "adjustment":I
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int v6, p1, v0

    sub-int/2addr v5, v6

    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 581
    .local v3, "localLength":I
    sub-int v5, p1, v0

    invoke-interface {v4, v5, p4, v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 582
    add-int/2addr p1, v3

    .line 583
    add-int/2addr v1, v3

    .line 584
    sub-int/2addr p2, v3

    .line 585
    add-int/lit8 v2, v2, 0x1

    .line 586
    goto :goto_0

    .line 588
    .end local v0    # "adjustment":I
    .end local v3    # "localLength":I
    .end local v4    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    invoke-interface {p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    invoke-interface {p4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 589
    return-void
.end method

.method private setComponents(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "newComponents":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    const/4 v6, 0x0

    .line 110
    sget-boolean v2, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 113
    :cond_0
    iput v6, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->lastAccessedComponentId:I

    .line 116
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iput-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 117
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v2, v2

    if-ge v1, v2, :cond_4

    .line 118
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 119
    .local v0, "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v3

    if-eq v2, v3, :cond_1

    .line 120
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "All buffers must have the same endianness."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 124
    :cond_1
    sget-boolean v2, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 125
    :cond_2
    sget-boolean v2, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->$assertionsDisabled:Z

    if-nez v2, :cond_3

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v2

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v3

    if-eq v2, v3, :cond_3

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 127
    :cond_3
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v0, v2, v1

    .line 117
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 131
    .end local v0    # "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    new-array v2, v2, [I

    iput-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    .line 132
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aput v6, v2, v6

    .line 133
    const/4 v1, 0x1

    :goto_1
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v2, v2

    if-gt v1, v2, :cond_5

    .line 134
    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    iget-object v3, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v4, v1, -0x1

    aget v3, v3, v4

    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    add-int/lit8 v5, v1, -0x1

    aget-object v4, v4, v5

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    add-int/2addr v3, v4

    aput v3, v2, v1

    .line 133
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 138
    :cond_5
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {p0, v6, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setIndex(II)V

    .line 139
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 166
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public arrayOffset()I
    .locals 1

    .prologue
    .line 170
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public capacity()I
    .locals 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v1, v1

    aget v0, v0, v1

    return v0
.end method

.method public copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 562
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 563
    .local v0, "componentId":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v2

    sub-int/2addr v2, p2

    if-le p1, v2, :cond_0

    .line 564
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too many bytes to copy - Needs "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int v4, p1, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", maximum is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 568
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-interface {v2, v3, p2}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 569
    .local v1, "dst":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->copyTo(IIILorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 570
    return-object v1
.end method

.method public decompose(II)Ljava/util/List;
    .locals 10
    .param p1, "index"    # I
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    if-nez p2, :cond_1

    .line 63
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 103
    :cond_0
    return-object v6

    .line 66
    :cond_1
    add-int v7, p1, p2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v8

    if-le v7, v8, :cond_2

    .line 67
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Too many bytes to decompose - Need "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, p2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", capacity is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 71
    :cond_2
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v2

    .line 72
    .local v2, "componentId":I
    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v7, v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 75
    .local v6, "slice":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v7, v7, v2

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 76
    .local v3, "first":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v7, v7, v2

    sub-int v7, p1, v7

    invoke-interface {v3, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 78
    move-object v0, v3

    .line 79
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    move v1, p2

    .line 81
    .local v1, "bytesToSlice":I
    :cond_3
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    .line 82
    .local v5, "readableBytes":I
    if-gt v1, v5, :cond_4

    .line 84
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/2addr v7, v1

    invoke-interface {v0, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 85
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :goto_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-ge v4, v7, :cond_0

    .line 100
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-interface {v6, v4, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 99
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 89
    .end local v4    # "i":I
    :cond_4
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    sub-int/2addr v1, v5

    .line 91
    add-int/lit8 v2, v2, 0x1

    .line 94
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v7, v7, v2

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 96
    if-gtz v1, :cond_3

    goto :goto_0
.end method

.method public discardReadBytes()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 719
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->readerIndex()I

    move-result v4

    .line 720
    .local v4, "localReaderIndex":I
    if-nez v4, :cond_0

    .line 769
    :goto_0
    return-void

    .line 723
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->writerIndex()I

    move-result v5

    .line 725
    .local v5, "localWriterIndex":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    sub-int v0, v7, v4

    .line 726
    .local v0, "bytesToMove":I
    invoke-virtual {p0, v4, v0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->decompose(II)Ljava/util/List;

    move-result-object v1

    .line 732
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 733
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    const/4 v7, 0x1

    invoke-direct {v1, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 738
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-static {v7, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 739
    .local v6, "padding":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 740
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 743
    move v2, v4

    .line 745
    .local v2, "localMarkedReaderIndex":I
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->resetReaderIndex()V

    .line 746
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->readerIndex()I
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    .line 750
    :goto_1
    move v3, v5

    .line 752
    .local v3, "localMarkedWriterIndex":I
    :try_start_1
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->resetWriterIndex()V

    .line 753
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->writerIndex()I
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    .line 758
    :goto_2
    invoke-direct {p0, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setComponents(Ljava/util/List;)V

    .line 761
    sub-int v7, v2, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 762
    sub-int v7, v3, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 763
    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setIndex(II)V

    .line 764
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->markReaderIndex()V

    .line 765
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->markWriterIndex()V

    .line 767
    sub-int v7, v5, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 768
    invoke-virtual {p0, v8, v5}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setIndex(II)V

    goto :goto_0

    .line 754
    :catch_0
    move-exception v7

    goto :goto_2

    .line 747
    .end local v3    # "localMarkedWriterIndex":I
    :catch_1
    move-exception v7

    goto :goto_1
.end method

.method public duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3

    .prologue
    .line 556
    new-instance v0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    invoke-direct {v0, p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;-><init>(Lorg/jboss/netty/buffer/CompositeChannelBuffer;)V

    .line 557
    .local v0, "duplicate":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->readerIndex()I

    move-result v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->writerIndex()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setIndex(II)V

    .line 558
    return-object v0
.end method

.method public factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance(Ljava/nio/ByteOrder;)Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    return-object v0
.end method

.method public getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 609
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 610
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Bytes needed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 616
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getByte(I)B
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 183
    .local v0, "componentId":I
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v1

    return v1
.end method

.method public getBytes(ILjava/nio/channels/GatheringByteChannel;I)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 314
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->useGathering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    invoke-virtual {p0, p1, p3}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->toByteBuffers(II)[Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/nio/channels/GatheringByteChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    long-to-int v0, v0

    .line 321
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p3}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/nio/channels/GatheringByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    goto :goto_0
.end method

.method public getBytes(ILjava/io/OutputStream;I)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v4

    sub-int/2addr v4, p3

    if-le p1, v4, :cond_0

    .line 327
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many bytes to be read - needs "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int v6, p1, p3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", maximum of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 330
    :cond_0
    if-gez p1, :cond_1

    .line 331
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    const-string v5, "Index must be >= 0"

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 333
    :cond_1
    if-nez p3, :cond_3

    .line 346
    :cond_2
    return-void

    .line 336
    :cond_3
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 337
    .local v1, "i":I
    :goto_0
    if-lez p3, :cond_2

    .line 338
    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v3, v4, v1

    .line 339
    .local v3, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v4, v1

    .line 340
    .local v0, "adjustment":I
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    sub-int v5, p1, v0

    sub-int/2addr v4, v5

    invoke-static {p3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 341
    .local v2, "localLength":I
    sub-int v4, p1, v0

    invoke-interface {v3, v4, p2, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/io/OutputStream;I)V

    .line 342
    add-int/2addr p1, v2

    .line 343
    sub-int/2addr p3, v2

    .line 344
    add-int/lit8 v1, v1, 0x1

    .line 345
    goto :goto_0
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "index"    # I
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 260
    .local v1, "componentId":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    .line 261
    .local v4, "limit":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 262
    .local v3, "length":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    sub-int/2addr v7, v3

    if-le p1, v7, :cond_0

    .line 263
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Too many bytes to be read - Needs "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", maximum is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 266
    :cond_0
    if-gez p1, :cond_1

    .line 267
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    const-string v8, "Index must be >= 0"

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 269
    :cond_1
    move v2, v1

    .line 271
    .local v2, "i":I
    :goto_0
    if-lez v3, :cond_2

    .line 272
    :try_start_0
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v6, v7, v2

    .line 273
    .local v6, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v7, v2

    .line 274
    .local v0, "adjustment":I
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    sub-int v8, p1, v0

    sub-int/2addr v7, v8

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 275
    .local v5, "localLength":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {p2, v7}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 276
    sub-int v7, p1, v0

    invoke-interface {v6, v7, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    add-int/2addr p1, v5

    .line 278
    sub-int/2addr v3, v5

    .line 279
    add-int/lit8 v2, v2, 0x1

    .line 280
    goto :goto_0

    .line 282
    .end local v0    # "adjustment":I
    .end local v5    # "localLength":I
    .end local v6    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catchall_0
    move-exception v7

    invoke-virtual {p2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    throw v7

    :cond_2
    invoke-virtual {p2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 284
    return-void
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 287
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v4

    sub-int/2addr v4, p4

    if-gt p1, v4, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    sub-int/2addr v4, p4

    if-le p3, v4, :cond_1

    .line 288
    :cond_0
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many bytes to be read - Needs "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int v6, p1, p4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " or "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int v6, p3, p4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", maximum is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " or "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 292
    :cond_1
    if-gez p1, :cond_2

    .line 293
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    const-string v5, "Index must be >= 0"

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 295
    :cond_2
    if-nez p4, :cond_4

    .line 309
    :cond_3
    return-void

    .line 298
    :cond_4
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 299
    .local v1, "i":I
    :goto_0
    if-lez p4, :cond_3

    .line 300
    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v3, v4, v1

    .line 301
    .local v3, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v4, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v4, v1

    .line 302
    .local v0, "adjustment":I
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    sub-int v5, p1, v0

    sub-int/2addr v4, v5

    invoke-static {p4, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 303
    .local v2, "localLength":I
    sub-int v4, p1, v0

    invoke-interface {v3, v4, p2, p3, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 304
    add-int/2addr p1, v2

    .line 305
    add-int/2addr p3, v2

    .line 306
    sub-int/2addr p4, v2

    .line 307
    add-int/lit8 v1, v1, 0x1

    .line 308
    goto :goto_0
.end method

.method public getBytes(I[BII)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v5

    sub-int/2addr v5, p4

    if-gt p1, v5, :cond_0

    array-length v5, p2

    sub-int/2addr v5, p4

    if-le p3, v5, :cond_1

    .line 232
    :cond_0
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too many bytes to read - Needs "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p1, p4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", maximum is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " or "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p2

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 236
    :cond_1
    if-gez p1, :cond_2

    .line 237
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    const-string v6, "Index must be >= 0"

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 239
    :cond_2
    if-nez p4, :cond_4

    .line 256
    :cond_3
    return-void

    .line 243
    :cond_4
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 245
    .local v1, "componentId":I
    move v2, v1

    .line 246
    .local v2, "i":I
    :goto_0
    if-lez p4, :cond_3

    .line 247
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v4, v5, v2

    .line 248
    .local v4, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v5, v2

    .line 249
    .local v0, "adjustment":I
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int v6, p1, v0

    sub-int/2addr v5, v6

    invoke-static {p4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 250
    .local v3, "localLength":I
    sub-int v5, p1, v0

    invoke-interface {v4, v5, p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    .line 251
    add-int/2addr p1, v3

    .line 252
    add-int/2addr p3, v3

    .line 253
    sub-int/2addr p4, v3

    .line 254
    add-int/lit8 v2, v2, 0x1

    .line 255
    goto :goto_0
.end method

.method public getInt(I)I
    .locals 5
    .param p1, "index"    # I

    .prologue
    const v4, 0xffff

    .line 209
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 210
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x4

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 211
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v1

    .line 215
    :goto_0
    return v1

    .line 212
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 213
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v1

    and-int/2addr v1, v4

    shl-int/lit8 v1, v1, 0x10

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v2

    and-int/2addr v2, v4

    or-int/2addr v1, v2

    goto :goto_0

    .line 215
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v1

    and-int/2addr v1, v4

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v2

    and-int/2addr v2, v4

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    goto :goto_0
.end method

.method public getLong(I)J
    .locals 9
    .param p1, "index"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 220
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 221
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x8

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 222
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v2

    .line 226
    :goto_0
    return-wide v2

    .line 223
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 224
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getInt(I)I

    move-result v1

    int-to-long v2, v1

    and-long/2addr v2, v6

    shl-long/2addr v2, v8

    add-int/lit8 v1, p1, 0x4

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getInt(I)I

    move-result v1

    int-to-long v4, v1

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    goto :goto_0

    .line 226
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getInt(I)I

    move-result v1

    int-to-long v2, v1

    and-long/2addr v2, v6

    add-int/lit8 v1, p1, 0x4

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getInt(I)I

    move-result v1

    int-to-long v4, v1

    and-long/2addr v4, v6

    shl-long/2addr v4, v8

    or-long/2addr v2, v4

    goto :goto_0
.end method

.method public getShort(I)S
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 187
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 188
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x2

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 189
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getShort(I)S

    move-result v1

    .line 193
    :goto_0
    return v1

    .line 190
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 191
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    int-to-short v1, v1

    goto :goto_0

    .line 193
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    int-to-short v1, v1

    goto :goto_0
.end method

.method public getUnsignedMedium(I)I
    .locals 5
    .param p1, "index"    # I

    .prologue
    const v4, 0xffff

    .line 198
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 199
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x3

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 200
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedMedium(I)I

    move-result v1

    .line 204
    :goto_0
    return v1

    .line 201
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 202
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v1

    and-int/2addr v1, v4

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    goto :goto_0

    .line 204
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getShort(I)S

    move-result v1

    and-int/2addr v1, v4

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->getByte(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    goto :goto_0
.end method

.method public hasArray()Z
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x0

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    return v0
.end method

.method public numComponents()I
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v0, v0

    return v0
.end method

.method public order()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method public setByte(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 349
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 350
    .local v0, "componentId":I
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 351
    return-void
.end method

.method public setBytes(ILjava/io/InputStream;I)I
    .locals 10
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 475
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 476
    .local v1, "componentId":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    sub-int/2addr v7, p3

    if-le p1, v7, :cond_0

    .line 477
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Too many bytes to write - Needs "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, p3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", maximum is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 481
    :cond_0
    move v2, v1

    .line 482
    .local v2, "i":I
    const/4 v5, 0x0

    .line 485
    .local v5, "readBytes":I
    :cond_1
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v6, v7, v2

    .line 486
    .local v6, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v7, v2

    .line 487
    .local v0, "adjustment":I
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    sub-int v8, p1, v0

    sub-int/2addr v7, v8

    invoke-static {p3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 488
    .local v3, "localLength":I
    sub-int v7, p1, v0

    invoke-interface {v6, v7, p2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/io/InputStream;I)I

    move-result v4

    .line 489
    .local v4, "localReadBytes":I
    if-gez v4, :cond_2

    .line 490
    if-nez v5, :cond_3

    .line 491
    const/4 v7, -0x1

    .line 509
    :goto_0
    return v7

    .line 497
    :cond_2
    if-ne v4, v3, :cond_4

    .line 498
    add-int/2addr p1, v3

    .line 499
    sub-int/2addr p3, v3

    .line 500
    add-int/2addr v5, v3

    .line 501
    add-int/lit8 v2, v2, 0x1

    .line 507
    :goto_1
    if-gtz p3, :cond_1

    :cond_3
    move v7, v5

    .line 509
    goto :goto_0

    .line 503
    :cond_4
    add-int/2addr p1, v4

    .line 504
    sub-int/2addr p3, v4

    .line 505
    add-int/2addr v5, v4

    goto :goto_1
.end method

.method public setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I
    .locals 10
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 515
    .local v1, "componentId":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    sub-int/2addr v7, p3

    if-le p1, v7, :cond_0

    .line 516
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Too many bytes to write - Needs "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, p3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", maximum is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 520
    :cond_0
    move v2, v1

    .line 521
    .local v2, "i":I
    const/4 v5, 0x0

    .line 523
    .local v5, "readBytes":I
    :cond_1
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v6, v7, v2

    .line 524
    .local v6, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v7, v2

    .line 525
    .local v0, "adjustment":I
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    sub-int v8, p1, v0

    sub-int/2addr v7, v8

    invoke-static {p3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 526
    .local v3, "localLength":I
    sub-int v7, p1, v0

    invoke-interface {v6, v7, p2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I

    move-result v4

    .line 528
    .local v4, "localReadBytes":I
    if-nez v4, :cond_3

    :cond_2
    :goto_0
    move v7, v5

    .line 552
    :goto_1
    return v7

    .line 532
    :cond_3
    if-gez v4, :cond_4

    .line 533
    if-nez v5, :cond_2

    .line 534
    const/4 v7, -0x1

    goto :goto_1

    .line 540
    :cond_4
    if-ne v4, v3, :cond_5

    .line 541
    add-int/2addr p1, v3

    .line 542
    sub-int/2addr p3, v3

    .line 543
    add-int/2addr v5, v3

    .line 544
    add-int/lit8 v2, v2, 0x1

    .line 550
    :goto_2
    if-gtz p3, :cond_1

    goto :goto_0

    .line 546
    :cond_5
    add-int/2addr p1, v4

    .line 547
    sub-int/2addr p3, v4

    .line 548
    add-int/2addr v5, v4

    goto :goto_2
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "index"    # I
    .param p2, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 427
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 428
    .local v1, "componentId":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    .line 429
    .local v4, "limit":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 430
    .local v3, "length":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    sub-int/2addr v7, v3

    if-le p1, v7, :cond_0

    .line 431
    new-instance v7, Ljava/lang/IndexOutOfBoundsException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Too many bytes to be written - Needs "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", maximum is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 435
    :cond_0
    move v2, v1

    .line 437
    .local v2, "i":I
    :goto_0
    if-lez v3, :cond_1

    .line 438
    :try_start_0
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v6, v7, v2

    .line 439
    .local v6, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v7, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v7, v2

    .line 440
    .local v0, "adjustment":I
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    sub-int v8, p1, v0

    sub-int/2addr v7, v8

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 441
    .local v5, "localLength":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {p2, v7}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 442
    sub-int v7, p1, v0

    invoke-interface {v6, v7, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 443
    add-int/2addr p1, v5

    .line 444
    sub-int/2addr v3, v5

    .line 445
    add-int/lit8 v2, v2, 0x1

    .line 446
    goto :goto_0

    .line 448
    .end local v0    # "adjustment":I
    .end local v5    # "localLength":I
    .end local v6    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catchall_0
    move-exception v7

    invoke-virtual {p2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    throw v7

    :cond_1
    invoke-virtual {p2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 450
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 453
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 454
    .local v1, "componentId":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v5

    sub-int/2addr v5, p4

    if-gt p1, v5, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int/2addr v5, p4

    if-le p3, v5, :cond_1

    .line 455
    :cond_0
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too many bytes to be written - Needs "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p1, p4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " or "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p3, p4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", maximum is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " or "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 460
    :cond_1
    move v2, v1

    .line 461
    .local v2, "i":I
    :goto_0
    if-lez p4, :cond_2

    .line 462
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v4, v5, v2

    .line 463
    .local v4, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v5, v2

    .line 464
    .local v0, "adjustment":I
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int v6, p1, v0

    sub-int/2addr v5, v6

    invoke-static {p4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 465
    .local v3, "localLength":I
    sub-int v5, p1, v0

    invoke-interface {v4, v5, p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 466
    add-int/2addr p1, v3

    .line 467
    add-int/2addr p3, v3

    .line 468
    sub-int/2addr p4, v3

    .line 469
    add-int/lit8 v2, v2, 0x1

    .line 470
    goto :goto_0

    .line 471
    .end local v0    # "adjustment":I
    .end local v3    # "localLength":I
    .end local v4    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    return-void
.end method

.method public setBytes(I[BII)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "src"    # [B
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 406
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v1

    .line 407
    .local v1, "componentId":I
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v5

    sub-int/2addr v5, p4

    if-gt p1, v5, :cond_0

    array-length v5, p2

    sub-int/2addr v5, p4

    if-le p3, v5, :cond_1

    .line 408
    :cond_0
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too many bytes to read - needs "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p1, p4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " or "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p3, p4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", maximum is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " or "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p2

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 413
    :cond_1
    move v2, v1

    .line 414
    .local v2, "i":I
    :goto_0
    if-lez p4, :cond_2

    .line 415
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v4, v5, v2

    .line 416
    .local v4, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v5, v2

    .line 417
    .local v0, "adjustment":I
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int v6, p1, v0

    sub-int/2addr v5, v6

    invoke-static {p4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 418
    .local v3, "localLength":I
    sub-int v5, p1, v0

    invoke-interface {v4, v5, p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(I[BII)V

    .line 419
    add-int/2addr p1, v3

    .line 420
    add-int/2addr p3, v3

    .line 421
    sub-int/2addr p4, v3

    .line 422
    add-int/lit8 v2, v2, 0x1

    .line 423
    goto :goto_0

    .line 424
    .end local v0    # "adjustment":I
    .end local v3    # "localLength":I
    .end local v4    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    return-void
.end method

.method public setInt(II)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 380
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 381
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x4

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 382
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 390
    :goto_0
    return-void

    .line 383
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 384
    ushr-int/lit8 v1, p2, 0x10

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    .line 385
    add-int/lit8 v1, p1, 0x2

    int-to-short v2, p2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    goto :goto_0

    .line 387
    :cond_1
    int-to-short v1, p2

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    .line 388
    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x10

    int-to-short v2, v2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    goto :goto_0
.end method

.method public setLong(IJ)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    const/16 v4, 0x20

    .line 393
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 394
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x8

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 395
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setLong(IJ)V

    .line 403
    :goto_0
    return-void

    .line 396
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 397
    ushr-long v2, p2, v4

    long-to-int v1, v2

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setInt(II)V

    .line 398
    add-int/lit8 v1, p1, 0x4

    long-to-int v2, p2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setInt(II)V

    goto :goto_0

    .line 400
    :cond_1
    long-to-int v1, p2

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setInt(II)V

    .line 401
    add-int/lit8 v1, p1, 0x4

    ushr-long v2, p2, v4

    long-to-int v2, v2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setInt(II)V

    goto :goto_0
.end method

.method public setMedium(II)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 367
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 368
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x3

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 369
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setMedium(II)V

    .line 377
    :goto_0
    return-void

    .line 370
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 371
    shr-int/lit8 v1, p2, 0x8

    int-to-short v1, v1

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    .line 372
    add-int/lit8 v1, p1, 0x2

    int-to-byte v2, p2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    goto :goto_0

    .line 374
    :cond_1
    int-to-short v1, p2

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setShort(II)V

    .line 375
    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    goto :goto_0
.end method

.method public setShort(II)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 354
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v0

    .line 355
    .local v0, "componentId":I
    add-int/lit8 v1, p1, 0x2

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    if-gt v1, v2, :cond_0

    .line 356
    iget-object v1, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v2, v2, v0

    sub-int v2, p1, v2

    invoke-interface {v1, v2, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setShort(II)V

    .line 364
    :goto_0
    return-void

    .line 357
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 358
    ushr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    .line 359
    add-int/lit8 v1, p1, 0x1

    int-to-byte v2, p2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    goto :goto_0

    .line 361
    :cond_1
    int-to-byte v1, p2

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    .line 362
    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->setByte(II)V

    goto :goto_0
.end method

.method public slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 620
    if-nez p1, :cond_0

    .line 621
    if-nez p2, :cond_3

    .line 622
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 639
    :goto_0
    return-object v1

    .line 624
    :cond_0
    if-ltz p1, :cond_1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v1

    sub-int/2addr v1, p2

    if-le p1, v1, :cond_2

    .line 625
    :cond_1
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid index: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - Bytes needed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int v3, p1, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", maximum is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 628
    :cond_2
    if-nez p2, :cond_3

    .line 629
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 632
    :cond_3
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->decompose(II)Ljava/util/List;

    move-result-object v0

    .line 633
    .local v0, "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 639
    new-instance v1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v2

    iget-boolean v3, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->gathering:Z

    invoke-direct {v1, v2, v0, v3}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;-><init>(Ljava/nio/ByteOrder;Ljava/util/List;Z)V

    goto :goto_0

    .line 635
    :pswitch_0
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 637
    :pswitch_1
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 633
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 8
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 644
    iget-object v6, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v6, v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_0

    .line 645
    iget-object v6, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-interface {v6, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 654
    :goto_0
    return-object v5

    .line 648
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->toByteBuffers(II)[Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 649
    .local v2, "buffers":[Ljava/nio/ByteBuffer;
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 650
    .local v5, "merged":Ljava/nio/ByteBuffer;
    move-object v0, v2

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 651
    .local v1, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v5, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 650
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 653
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    :cond_1
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    goto :goto_0
.end method

.method public toByteBuffers(II)[Ljava/nio/ByteBuffer;
    .locals 8
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 659
    add-int v5, p1, p2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v6

    if-le v5, v6, :cond_0

    .line 660
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Too many bytes to convert - Needs"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int v7, p1, p2

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", maximum is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 663
    :cond_0
    if-gez p1, :cond_1

    .line 664
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    const-string v6, "Index must be >= 0"

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 666
    :cond_1
    if-nez p2, :cond_2

    .line 667
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/nio/ByteBuffer;

    .line 683
    :goto_0
    return-object v5

    .line 670
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v5, v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 672
    .local v1, "buffers":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->componentId(I)I

    move-result v2

    .line 673
    .local v2, "i":I
    :goto_1
    if-lez p2, :cond_3

    .line 674
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    aget-object v4, v5, v2

    .line 675
    .local v4, "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v5, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->indices:[I

    aget v0, v5, v2

    .line 676
    .local v0, "adjustment":I
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    sub-int v6, p1, v0

    sub-int/2addr v5, v6

    invoke-static {p2, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 677
    .local v3, "localLength":I
    sub-int v5, p1, v0

    invoke-interface {v4, v5, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 678
    add-int/2addr p1, v3

    .line 679
    sub-int/2addr p2, v3

    .line 680
    add-int/lit8 v2, v2, 0x1

    .line 681
    goto :goto_1

    .line 683
    .end local v0    # "adjustment":I
    .end local v3    # "localLength":I
    .end local v4    # "s":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/nio/ByteBuffer;

    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 773
    invoke-super {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 774
    .local v0, "result":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 775
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", components="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->components:[Lorg/jboss/netty/buffer/ChannelBuffer;

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public useGathering()Z
    .locals 2

    .prologue
    .line 55
    iget-boolean v0, p0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->gathering:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v0

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
