.class public final Lcom/ning/http/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final STRING_BUILDERS:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/ning/http/util/StringUtils$1;

    invoke-direct {v0}, Lcom/ning/http/util/StringUtils$1;-><init>()V

    sput-object v0, Lcom/ning/http/util/StringUtils;->STRING_BUILDERS:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static byteBuffer2ByteArray(Ljava/nio/ByteBuffer;)[B
    .locals 2
    .param p0, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 46
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    new-array v0, v1, [B

    .line 47
    .local v0, "rawBase":[B
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 48
    return-object v0
.end method

.method public static charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "cs"    # Ljava/lang/CharSequence;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 42
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static charSequence2Bytes(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)[B
    .locals 2
    .param p0, "sb"    # Ljava/lang/CharSequence;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 52
    invoke-static {p0, p1}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 53
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {v0}, Lcom/ning/http/util/StringUtils;->byteBuffer2ByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v1

    return-object v1
.end method

.method public static stringBuilder()Ljava/lang/StringBuilder;
    .locals 2

    .prologue
    .line 32
    sget-object v1, Lcom/ning/http/util/StringUtils;->STRING_BUILDERS:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    .line 33
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 34
    return-object v0
.end method
