.class Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;
.super Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;
.source "DefaultNioSocketChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;


# static fields
.field private static final DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private volatile predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

.field private volatile predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

.field private volatile writeBufferHighWaterMark:I

.field private volatile writeBufferLowWaterMark:I

.field private volatile writeSpinCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 39
    new-instance v0, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictorFactory;

    invoke-direct {v0}, Lorg/jboss/netty/channel/AdaptiveReceiveBufferSizePredictorFactory;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    return-void
.end method

.method constructor <init>(Ljava/net/Socket;)V
    .locals 1
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;-><init>(Ljava/net/Socket;)V

    .line 42
    const/high16 v0, 0x10000

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferHighWaterMark:I

    .line 43
    const v0, 0x8000

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferLowWaterMark:I

    .line 45
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .line 46
    const/16 v0, 0x10

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeSpinCount:I

    .line 50
    return-void
.end method

.method private setWriteBufferHighWaterMark0(I)V
    .locals 3
    .param p1, "writeBufferHighWaterMark"    # I

    .prologue
    .line 105
    if-gez p1, :cond_0

    .line 106
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferHighWaterMark: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferHighWaterMark:I

    .line 110
    return-void
.end method

.method private setWriteBufferLowWaterMark0(I)V
    .locals 3
    .param p1, "writeBufferLowWaterMark"    # I

    .prologue
    .line 127
    if-gez p1, :cond_0

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferLowWaterMark: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferLowWaterMark:I

    .line 132
    return-void
.end method


# virtual methods
.method public getReceiveBufferSizePredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    .locals 5

    .prologue
    .line 147
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .line 148
    .local v1, "predictor":Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    if-nez v1, :cond_0

    .line 150
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getReceiveBufferSizePredictorFactory()Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    move-result-object v2

    invoke-interface {v2}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;->getPredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :cond_0
    return-object v1

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/jboss/netty/channel/ChannelException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to create a new "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getReceiveBufferSizePredictorFactory()Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    return-object v0
.end method

.method public getWriteBufferHighWaterMark()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferHighWaterMark:I

    return v0
.end method

.method public getWriteBufferLowWaterMark()I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeBufferLowWaterMark:I

    return v0
.end method

.method public getWriteSpinCount()I
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeSpinCount:I

    return v0
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 70
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    .end local p2    # "value":Ljava/lang/Object;
    :goto_0
    return v0

    .line 74
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    const-string v1, "writeBufferHighWaterMark"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteBufferHighWaterMark0(I)V

    goto :goto_0

    .line 76
    :cond_1
    const-string v1, "writeBufferLowWaterMark"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 77
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteBufferLowWaterMark0(I)V

    goto :goto_0

    .line 78
    :cond_2
    const-string v1, "writeSpinCount"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 79
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteSpinCount(I)V

    goto :goto_0

    .line 80
    :cond_3
    const-string v1, "receiveBufferSizePredictorFactory"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 81
    check-cast p2, Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setReceiveBufferSizePredictorFactory(Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;)V

    goto :goto_0

    .line 82
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_4
    const-string v1, "receiveBufferSizePredictor"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 83
    check-cast p2, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setReceiveBufferSizePredictor(Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;)V

    goto :goto_0

    .line 85
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOptions(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "options":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;->setOptions(Ljava/util/Map;)V

    .line 55
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 57
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    ushr-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteBufferLowWaterMark0(I)V

    .line 58
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "writeBufferLowWaterMark cannot be greater than writeBufferHighWaterMark; setting to the half of the writeBufferHighWaterMark."

    invoke-interface {v0, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 66
    :cond_0
    return-void
.end method

.method public setReceiveBufferSizePredictor(Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;)V
    .locals 2
    .param p1, "predictor"    # Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .prologue
    .line 163
    if-nez p1, :cond_0

    .line 164
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "predictor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .line 167
    return-void
.end method

.method public setReceiveBufferSizePredictorFactory(Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;)V
    .locals 2
    .param p1, "predictorFactory"    # Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .prologue
    .line 174
    if-nez p1, :cond_0

    .line 175
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "predictorFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .line 178
    return-void
.end method

.method public setWriteBufferHighWaterMark(I)V
    .locals 3
    .param p1, "writeBufferHighWaterMark"    # I

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferHighWaterMark cannot be less than writeBufferLowWaterMark ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteBufferHighWaterMark0(I)V

    .line 102
    return-void
.end method

.method public setWriteBufferLowWaterMark(I)V
    .locals 3
    .param p1, "writeBufferLowWaterMark"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    if-le p1, v0, :cond_0

    .line 118
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferLowWaterMark cannot be greater than writeBufferHighWaterMark ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->setWriteBufferLowWaterMark0(I)V

    .line 124
    return-void
.end method

.method public setWriteSpinCount(I)V
    .locals 2
    .param p1, "writeSpinCount"    # I

    .prologue
    .line 139
    if-gtz p1, :cond_0

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "writeSpinCount must be a positive integer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioSocketChannelConfig;->writeSpinCount:I

    .line 144
    return-void
.end method
