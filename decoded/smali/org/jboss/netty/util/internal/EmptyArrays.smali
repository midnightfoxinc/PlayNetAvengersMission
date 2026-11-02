.class public final Lorg/jboss/netty/util/internal/EmptyArrays;
.super Ljava/lang/Object;
.source "EmptyArrays.java"


# static fields
.field public static final EMPTY_BOOLEANS:[Z

.field public static final EMPTY_BYTES:[B

.field public static final EMPTY_BYTE_BUFFERS:[Ljava/nio/ByteBuffer;

.field public static final EMPTY_DOUBLES:[D

.field public static final EMPTY_FLOATS:[F

.field public static final EMPTY_INTS:[I

.field public static final EMPTY_LONGS:[J

.field public static final EMPTY_OBJECTS:[Ljava/lang/Object;

.field public static final EMPTY_SHORTS:[S

.field public static final EMPTY_STACK_TRACE:[Ljava/lang/StackTraceElement;

.field public static final EMPTY_STRINGS:[Ljava/lang/String;

.field public static final EMPTY_X509_CERTIFICATES:[Ljava/security/cert/X509Certificate;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 24
    new-array v0, v1, [B

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_BYTES:[B

    .line 25
    new-array v0, v1, [Z

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_BOOLEANS:[Z

    .line 26
    new-array v0, v1, [D

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_DOUBLES:[D

    .line 27
    new-array v0, v1, [F

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_FLOATS:[F

    .line 28
    new-array v0, v1, [I

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_INTS:[I

    .line 29
    new-array v0, v1, [S

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_SHORTS:[S

    .line 30
    new-array v0, v1, [J

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_LONGS:[J

    .line 31
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_OBJECTS:[Ljava/lang/Object;

    .line 32
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STRINGS:[Ljava/lang/String;

    .line 33
    new-array v0, v1, [Ljava/lang/StackTraceElement;

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STACK_TRACE:[Ljava/lang/StackTraceElement;

    .line 34
    new-array v0, v1, [Ljava/nio/ByteBuffer;

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_BYTE_BUFFERS:[Ljava/nio/ByteBuffer;

    .line 35
    new-array v0, v1, [Ljava/security/cert/X509Certificate;

    sput-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_X509_CERTIFICATES:[Ljava/security/cert/X509Certificate;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
