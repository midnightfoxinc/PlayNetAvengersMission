.class public final Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;
.super Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;
.source "FingerprintTrustManagerFactory.java"


# static fields
.field private static final FINGERPRINT_PATTERN:Ljava/util/regex/Pattern;

.field private static final FINGERPRINT_STRIP_PATTERN:Ljava/util/regex/Pattern;

.field private static final SHA1_BYTE_LEN:I = 0x14

.field private static final SHA1_HEX_LEN:I = 0x28

.field private static final tlmd:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/security/MessageDigest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final fingerprints:[[B

.field private final tm:Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    const-string v0, "^[0-9a-fA-F:]+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->FINGERPRINT_PATTERN:Ljava/util/regex/Pattern;

    .line 65
    const-string v0, ":"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->FINGERPRINT_STRIP_PATTERN:Ljava/util/regex/Pattern;

    .line 69
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->tlmd:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "fingerprints":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    invoke-static {p1}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->toFingerprintArray(Ljava/lang/Iterable;)[[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;-><init>([[B)V

    .line 128
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/String;)V
    .locals 1
    .param p1, "fingerprints"    # [Ljava/lang/String;

    .prologue
    .line 136
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->toFingerprintArray(Ljava/lang/Iterable;)[[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;-><init>([[B)V

    .line 137
    return-void
.end method

.method public varargs constructor <init>([[B)V
    .locals 8
    .param p1, "fingerprints"    # [[B

    .prologue
    .line 144
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;-><init>()V

    .line 81
    new-instance v5, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;

    invoke-direct {v5, p0}, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory$2;-><init>(Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;)V

    iput-object v5, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->tm:Ljavax/net/ssl/TrustManager;

    .line 145
    if-nez p1, :cond_0

    .line 146
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "fingerprints"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 149
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object v0, p1

    .local v0, "arr$":[[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 151
    .local v1, "f":[B
    if-nez v1, :cond_2

    .line 161
    .end local v1    # "f":[B
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [[B

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[B

    iput-object v5, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->fingerprints:[[B

    .line 162
    return-void

    .line 154
    .restart local v1    # "f":[B
    :cond_2
    array-length v5, v1

    const/16 v6, 0x14

    if-eq v5, v6, :cond_3

    .line 155
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "malformed fingerprint: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->hexDump(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " (expected: SHA1)"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 158
    :cond_3
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;)[[B
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->fingerprints:[[B

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/ThreadLocal;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->tlmd:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method private static toFingerprintArray(Ljava/lang/Iterable;)[[B
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;)[[B"
        }
    .end annotation

    .prologue
    .line 165
    .local p0, "fingerprints":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 166
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "fingerprints"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 169
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 171
    .local v0, "f":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 190
    .end local v0    # "f":Ljava/lang/String;
    :cond_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [[B

    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[B

    return-object v6

    .line 175
    .restart local v0    # "f":Ljava/lang/String;
    :cond_3
    sget-object v6, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->FINGERPRINT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-nez v6, :cond_4

    .line 176
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "malformed fingerprint: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 178
    :cond_4
    sget-object v6, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->FINGERPRINT_STRIP_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x28

    if-eq v6, v7, :cond_5

    .line 180
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "malformed fingerprint: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " (expected: SHA1)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 183
    :cond_5
    const/16 v6, 0x14

    new-array v1, v6, [B

    .line 184
    .local v1, "farr":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v1

    if-ge v2, v6, :cond_1

    .line 185
    shl-int/lit8 v5, v2, 0x1

    .line 186
    .local v5, "strIdx":I
    add-int/lit8 v6, v5, 0x2

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x10

    invoke-static {v6, v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v1, v2

    .line 184
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected engineGetTrustManagers()[Ljavax/net/ssl/TrustManager;
    .locals 3

    .prologue
    .line 201
    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/util/FingerprintTrustManagerFactory;->tm:Ljavax/net/ssl/TrustManager;

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected engineInit(Ljava/security/KeyStore;)V
    .locals 0
    .param p1, "keyStore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 194
    return-void
.end method

.method protected engineInit(Ljavax/net/ssl/ManagerFactoryParameters;)V
    .locals 0
    .param p1, "managerFactoryParameters"    # Ljavax/net/ssl/ManagerFactoryParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 197
    return-void
.end method
