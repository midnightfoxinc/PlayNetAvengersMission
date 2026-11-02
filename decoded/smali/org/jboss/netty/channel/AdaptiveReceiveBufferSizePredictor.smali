.class public Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;
.super Ljava/lang/Object;
.source "AdaptiveReceiveBufferSizePredictor.java"

# interfaces
.implements Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;


# static fields
.field static final DEFAULT_INITIAL:I = 0x400

.field static final DEFAULT_MAXIMUM:I = 0x10000

.field static final DEFAULT_MINIMUM:I = 0x40

.field private static final INDEX_DECREMENT:I = 0x1

.field private static final INDEX_INCREMENT:I = 0x4

.field private static final SIZE_TABLE:[I


# instance fields
.field private decreaseNow:Z

.field private index:I

.field private final maxIndex:I

.field private final minIndex:I

.field private nextReceiveBufferSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/16 v10, 0x8

    .line 44
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v4, "sizeTable":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-gt v0, v10, :cond_0

    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x4

    :goto_1
    const/16 v5, 0x20

    if-ge v0, v5, :cond_3

    .line 50
    const-wide/16 v8, 0x1

    shl-long v6, v8, v0

    .line 51
    .local v6, "v":J
    const/4 v5, 0x4

    ushr-long v2, v6, v5

    .line 52
    .local v2, "inc":J
    const/4 v5, 0x3

    shl-long v8, v2, v5

    sub-long/2addr v6, v8

    .line 54
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-ge v1, v10, :cond_2

    .line 55
    add-long/2addr v6, v2

    .line 56
    const-wide/32 v8, 0x7fffffff

    cmp-long v5, v6, v8

    if-lez v5, :cond_1

    .line 57
    const v5, 0x7fffffff

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 59
    :cond_1
    long-to-int v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 49
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 64
    .end local v1    # "j":I
    .end local v2    # "inc":J
    .end local v6    # "v":J
    :cond_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [I

    sput-object v5, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    .line 65
    const/4 v0, 0x0

    :goto_4
    sget-object v5, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    array-length v5, v5

    if-ge v0, v5, :cond_4

    .line 66
    sget-object v8, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aput v5, v8, v0

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 68
    :cond_4
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 107
    const/16 v0, 0x40

    const/16 v1, 0x400

    const/high16 v2, 0x10000

    invoke-direct {p0, v0, v1, v2}, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;-><init>(III)V

    .line 108
    return-void
.end method

.method public constructor <init>(III)V
    .locals 5
    .param p1, "minimum"    # I
    .param p2, "initial"    # I
    .param p3, "maximum"    # I

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    if-gtz p1, :cond_0

    .line 119
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minimum: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 121
    :cond_0
    if-ge p2, p1, :cond_1

    .line 122
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initial: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 124
    :cond_1
    if-ge p3, p2, :cond_2

    .line 125
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "maximum: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    :cond_2
    invoke-static {p1}, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->getSizeTableIndex(I)I

    move-result v1

    .line 129
    .local v1, "minIndex":I
    sget-object v2, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    aget v2, v2, v1

    if-ge v2, p1, :cond_3

    .line 130
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->minIndex:I

    .line 135
    :goto_0
    invoke-static {p3}, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->getSizeTableIndex(I)I

    move-result v0

    .line 136
    .local v0, "maxIndex":I
    sget-object v2, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    aget v2, v2, v0

    if-le v2, p3, :cond_4

    .line 137
    add-int/lit8 v2, v0, -0x1

    iput v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->maxIndex:I

    .line 142
    :goto_1
    invoke-static {p2}, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->getSizeTableIndex(I)I

    move-result v2

    iput v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    .line 143
    sget-object v2, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    iget v3, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    aget v2, v2, v3

    iput v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->nextReceiveBufferSize:I

    .line 144
    return-void

    .line 132
    .end local v0    # "maxIndex":I
    :cond_3
    iput v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->minIndex:I

    goto :goto_0

    .line 139
    .restart local v0    # "maxIndex":I
    :cond_4
    iput v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->maxIndex:I

    goto :goto_1
.end method

.method private static getSizeTableIndex(I)I
    .locals 8
    .param p0, "size"    # I

    .prologue
    .line 71
    const/16 v6, 0x10

    if-gt p0, v6, :cond_1

    .line 72
    add-int/lit8 v3, p0, -0x1

    .line 88
    :cond_0
    return v3

    .line 75
    :cond_1
    const/4 v1, 0x0

    .line 76
    .local v1, "bits":I
    move v5, p0

    .line 78
    .local v5, "v":I
    :cond_2
    ushr-int/lit8 v5, v5, 0x1

    .line 79
    add-int/lit8 v1, v1, 0x1

    .line 80
    if-nez v5, :cond_2

    .line 82
    shl-int/lit8 v0, v1, 0x3

    .line 83
    .local v0, "baseIdx":I
    add-int/lit8 v4, v0, -0x12

    .line 84
    .local v4, "startIdx":I
    add-int/lit8 v2, v0, -0x19

    .line 86
    .local v2, "endIdx":I
    move v3, v4

    .local v3, "i":I
    :goto_0
    if-lt v3, v2, :cond_3

    .line 87
    sget-object v6, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    aget v6, v6, v3

    if-ge p0, v6, :cond_0

    .line 86
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 92
    :cond_3
    new-instance v6, Ljava/lang/Error;

    const-string v7, "shouldn\'t reach here; please file a bug report."

    invoke-direct {v6, v7}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v6
.end method


# virtual methods
.method public nextReceiveBufferSize()I
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->nextReceiveBufferSize:I

    return v0
.end method

.method public previousReceiveBufferSize(I)V
    .locals 3
    .param p1, "previousReceiveBufferSize"    # I

    .prologue
    const/4 v2, 0x0

    .line 151
    sget-object v0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    iget v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    aget v0, v0, v1

    if-gt p1, v0, :cond_2

    .line 152
    iget-boolean v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->decreaseNow:Z

    if-eqz v0, :cond_1

    .line 153
    iget v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->minIndex:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    .line 154
    sget-object v0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    iget v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    aget v0, v0, v1

    iput v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->nextReceiveBufferSize:I

    .line 155
    iput-boolean v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->decreaseNow:Z

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->decreaseNow:Z

    goto :goto_0

    .line 159
    :cond_2
    iget v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->nextReceiveBufferSize:I

    if-lt p1, v0, :cond_0

    .line 160
    iget v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    add-int/lit8 v0, v0, 0x4

    iget v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->maxIndex:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    .line 161
    sget-object v0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->SIZE_TABLE:[I

    iget v1, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->index:I

    aget v0, v0, v1

    iput v0, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->nextReceiveBufferSize:I

    .line 162
    iput-boolean v2, p0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictor;->decreaseNow:Z

    goto :goto_0
.end method
