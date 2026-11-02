.class final Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;
.super Ljava/text/SimpleDateFormat;
.source "HttpHeaderDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete2;,
        Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete1;
    }
.end annotation


# static fields
.field private static final FORMAT_THREAD_LOCAL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0xcd746dc23d6092dL


# instance fields
.field private final format1:Ljava/text/SimpleDateFormat;

.field private final format2:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->FORMAT_THREAD_LOCAL:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 57
    const-string v0, "E, dd MMM yyyy HH:mm:ss z"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 37
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete1;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format1:Ljava/text/SimpleDateFormat;

    .line 38
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete2;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$HttpHeaderDateFormatObsolete2;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format2:Ljava/text/SimpleDateFormat;

    .line 58
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 59
    return-void
.end method

.method synthetic constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat$1;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;-><init>()V

    return-void
.end method

.method public static get()Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->FORMAT_THREAD_LOCAL:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;

    return-object v0
.end method


# virtual methods
.method public parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 63
    invoke-super {p0, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 64
    .local v0, "date":Ljava/util/Date;
    if-nez v0, :cond_0

    .line 65
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format1:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 67
    :cond_0
    if-nez v0, :cond_1

    .line 68
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpHeaderDateFormat;->format2:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 70
    :cond_1
    return-object v0
.end method
