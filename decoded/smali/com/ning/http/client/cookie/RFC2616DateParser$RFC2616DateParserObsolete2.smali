.class final Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete2;
.super Ljava/text/SimpleDateFormat;
.source "RFC2616DateParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/cookie/RFC2616DateParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RFC2616DateParserObsolete2"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x29c810865107ca62L


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 87
    const-string v0, "E MMM d HH:mm:ss yyyy"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 88
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete2;->setTimeZone(Ljava/util/TimeZone;)V

    .line 89
    return-void
.end method
