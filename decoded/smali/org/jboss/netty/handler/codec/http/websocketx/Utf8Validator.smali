.class final Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;
.super Ljava/lang/Object;
.source "Utf8Validator.java"


# static fields
.field private static final STATES:[B

.field private static final TYPES:[B

.field private static final UTF8_ACCEPT:I = 0x0

.field private static final UTF8_REJECT:I = 0xc


# instance fields
.field private checking:Z

.field private codep:I

.field private state:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->TYPES:[B

    .line 58
    const/16 v0, 0x6c

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->STATES:[B

    return-void

    .line 47
    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x9t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x8t
        0x8t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0xat
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x4t
        0x3t
        0x3t
        0xbt
        0x6t
        0x6t
        0x6t
        0x5t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
        0x8t
    .end array-data

    .line 58
    :array_1
    .array-data 1
        0x0t
        0xct
        0x18t
        0x24t
        0x3ct
        0x60t
        0x54t
        0xct
        0xct
        0xct
        0x30t
        0x48t
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0x0t
        0xct
        0xct
        0xct
        0xct
        0xct
        0x0t
        0xct
        0x0t
        0xct
        0xct
        0xct
        0x18t
        0xct
        0xct
        0xct
        0xct
        0xct
        0x18t
        0xct
        0x18t
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0x18t
        0xct
        0xct
        0xct
        0xct
        0xct
        0x18t
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0x18t
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0x24t
        0xct
        0x24t
        0xct
        0xct
        0xct
        0x24t
        0xct
        0xct
        0xct
        0xct
        0xct
        0x24t
        0xct
        0x24t
        0xct
        0xct
        0xct
        0x24t
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
        0xct
    .end array-data
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    return-void
.end method

.method private write(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 78
    sget-object v1, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->TYPES:[B

    and-int/lit16 v2, p1, 0xff

    aget-byte v0, v1, v2

    .line 80
    .local v0, "type":B
    iget v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    if-eqz v1, :cond_0

    and-int/lit8 v1, p1, 0x3f

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->codep:I

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    :goto_0
    iput v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->codep:I

    .line 82
    sget-object v1, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->STATES:[B

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    add-int/2addr v2, v0

    aget-byte v1, v1, v2

    iput v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    .line 84
    iget v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_1

    .line 85
    new-instance v1, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    const-string v2, "bytes are not UTF-8"

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :cond_0
    const/16 v1, 0xff

    shr-int/2addr v1, v0

    and-int/2addr v1, p1

    goto :goto_0

    .line 87
    :cond_1
    return-void
.end method


# virtual methods
.method public check([B)V
    .locals 5
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 71
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->checking:Z

    .line 72
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-byte v1, v0, v2

    .line 73
    .local v1, "b":B
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->write(I)V

    .line 72
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    .end local v1    # "b":B
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 90
    iput-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->checking:Z

    .line 91
    iput v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->codep:I

    .line 92
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    if-eqz v0, :cond_0

    .line 93
    iput v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->state:I

    .line 94
    new-instance v0, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    const-string v1, "bytes are not UTF-8"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_0
    return-void
.end method

.method public isChecking()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->checking:Z

    return v0
.end method
