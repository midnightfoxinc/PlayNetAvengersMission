.class public Lcom/disneymobile/mocha/NSNumberFormatter;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSNumberFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSNumberFormatter$1;
    }
.end annotation


# static fields
.field private static commaFormatter:Lcom/disneymobile/mocha/NSNumberFormatter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 44
    return-void
.end method

.method public static commaFormatter()Lcom/disneymobile/mocha/NSNumberFormatter;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/disneymobile/mocha/NSNumberFormatter;->commaFormatter:Lcom/disneymobile/mocha/NSNumberFormatter;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lcom/disneymobile/mocha/NSNumberFormatter;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSNumberFormatter;-><init>()V

    sput-object v0, Lcom/disneymobile/mocha/NSNumberFormatter;->commaFormatter:Lcom/disneymobile/mocha/NSNumberFormatter;

    .line 15
    :cond_0
    sget-object v0, Lcom/disneymobile/mocha/NSNumberFormatter;->commaFormatter:Lcom/disneymobile/mocha/NSNumberFormatter;

    return-object v0
.end method


# virtual methods
.method public stringFromNumber(Lcom/disneymobile/mocha/NSNumber;)Ljava/lang/String;
    .locals 6
    .param p1, "number"    # Lcom/disneymobile/mocha/NSNumber;

    .prologue
    .line 20
    if-nez p1, :cond_0

    .line 21
    const-string v3, ""

    .line 47
    :goto_0
    return-object v3

    .line 24
    :cond_0
    iget-object v2, p1, Lcom/disneymobile/mocha/NSNumber;->datatype:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    .line 26
    .local v2, "datatype":Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;
    sget-object v4, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Boolean:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    if-eq v4, v2, :cond_1

    sget-object v4, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->Char:Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;

    if-ne v4, v2, :cond_2

    .line 27
    :cond_1
    const-string v3, ""

    goto :goto_0

    .line 30
    :cond_2
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "###,###,###,###,###,###,###,###,###,##0.0#############################"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 31
    .local v0, "commaFormatWithDecimals":Ljava/text/DecimalFormat;
    new-instance v1, Ljava/text/DecimalFormat;

    const-string v4, "###,###,###,###,###,###,###,###,###,##0"

    invoke-direct {v1, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 32
    .local v1, "commaFormatWithoutDecimals":Ljava/text/DecimalFormat;
    const-string v3, ""

    .line 34
    .local v3, "formattedString":Ljava/lang/String;
    sget-object v4, Lcom/disneymobile/mocha/NSNumberFormatter$1;->$SwitchMap$com$disneymobile$mocha$NSNumber$NSNumberDatatype:[I

    invoke-virtual {v2}, Lcom/disneymobile/mocha/NSNumber$NSNumberDatatype;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 37
    :pswitch_0
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSNumber;->doubleValue()D

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    .line 38
    goto :goto_0

    .line 43
    :pswitch_1
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSNumber;->longValue()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 34
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
