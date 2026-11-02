.class public Lcom/ning/http/client/cookie/RFC2616DateParser;
.super Ljava/text/SimpleDateFormat;
.source "RFC2616DateParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete2;,
        Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete1;
    }
.end annotation


# static fields
.field private static final DATE_FORMAT_HOLDER:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/ning/http/client/cookie/RFC2616DateParser;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final format1:Ljava/text/SimpleDateFormat;

.field private final format2:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/ning/http/client/cookie/RFC2616DateParser$1;

    invoke-direct {v0}, Lcom/ning/http/client/cookie/RFC2616DateParser$1;-><init>()V

    sput-object v0, Lcom/ning/http/client/cookie/RFC2616DateParser;->DATE_FORMAT_HOLDER:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 49
    const-string v0, "E, dd MMM yyyy HH:mm:ss z"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 30
    new-instance v0, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete1;

    invoke-direct {v0}, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete1;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/cookie/RFC2616DateParser;->format1:Ljava/text/SimpleDateFormat;

    .line 31
    new-instance v0, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete2;

    invoke-direct {v0}, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete2;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/cookie/RFC2616DateParser;->format2:Ljava/text/SimpleDateFormat;

    .line 50
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/cookie/RFC2616DateParser;->setTimeZone(Ljava/util/TimeZone;)V

    .line 51
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/cookie/RFC2616DateParser$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/cookie/RFC2616DateParser$1;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/ning/http/client/cookie/RFC2616DateParser;-><init>()V

    return-void
.end method

.method public static get()Lcom/ning/http/client/cookie/RFC2616DateParser;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/ning/http/client/cookie/RFC2616DateParser;->DATE_FORMAT_HOLDER:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/cookie/RFC2616DateParser;

    return-object v0
.end method


# virtual methods
.method public parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 55
    invoke-super {p0, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 56
    .local v0, "date":Ljava/util/Date;
    if-nez v0, :cond_0

    .line 57
    iget-object v1, p0, Lcom/ning/http/client/cookie/RFC2616DateParser;->format1:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 59
    :cond_0
    if-nez v0, :cond_1

    .line 60
    iget-object v1, p0, Lcom/ning/http/client/cookie/RFC2616DateParser;->format2:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p1, p2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 62
    :cond_1
    return-object v0
.end method
