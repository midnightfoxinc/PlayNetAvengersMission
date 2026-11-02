.class final Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete1;
.super Ljava/text/SimpleDateFormat;
.source "RFC2616DateParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/cookie/RFC2616DateParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RFC2616DateParserObsolete1"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2c1ac81abcc628baL


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 73
    const-string v0, "E, dd-MMM-yy HH:mm:ss z"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 74
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/cookie/RFC2616DateParser$RFC2616DateParserObsolete1;->setTimeZone(Ljava/util/TimeZone;)V

    .line 75
    return-void
.end method
