.class final Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;
.super Ljava/security/SecureRandom;
.source "ThreadLocalInsecureRandom.java"


# static fields
.field private static final INSTANCE:Ljava/security/SecureRandom;

.field private static final serialVersionUID:J = -0x71ede8812866b16fL


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->INSTANCE:Ljava/security/SecureRandom;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/security/SecureRandom;-><init>()V

    return-void
.end method

.method static current()Ljava/security/SecureRandom;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->INSTANCE:Ljava/security/SecureRandom;

    return-object v0
.end method

.method private static random()Ljava/util/Random;
    .locals 1

    .prologue
    .line 98
    invoke-static {}, Lorg/jboss/netty/util/internal/ThreadLocalRandom;->current()Lorg/jboss/netty/util/internal/ThreadLocalRandom;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public generateSeed(I)[B
    .locals 2
    .param p1, "numBytes"    # I

    .prologue
    .line 57
    new-array v0, p1, [B

    .line 58
    .local v0, "seed":[B
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 59
    return-object v0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    const-string v0, "insecure"

    return-object v0
.end method

.method public nextBoolean()Z
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextBoolean()Z

    move-result v0

    return v0
.end method

.method public nextBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 52
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Random;->nextBytes([B)V

    .line 53
    return-void
.end method

.method public nextDouble()D
    .locals 2

    .prologue
    .line 89
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public nextFloat()F
    .locals 1

    .prologue
    .line 84
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result v0

    return v0
.end method

.method public nextGaussian()D
    .locals 2

    .prologue
    .line 94
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextGaussian()D

    move-result-wide v0

    return-wide v0
.end method

.method public nextInt()I
    .locals 1

    .prologue
    .line 64
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    return v0
.end method

.method public nextInt(I)I
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 69
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    return v0
.end method

.method public nextLong()J
    .locals 2

    .prologue
    .line 79
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->random()Ljava/util/Random;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public setSeed(J)V
    .locals 0
    .param p1, "seed"    # J

    .prologue
    .line 48
    return-void
.end method

.method public setSeed([B)V
    .locals 0
    .param p1, "seed"    # [B

    .prologue
    .line 45
    return-void
.end method
