.class public Lcom/fasterxml/jackson/databind/util/ISO8601Utils;
.super Ljava/lang/Object;
.source "ISO8601Utils.java"


# static fields
.field private static final GMT_ID:Ljava/lang/String; = "GMT"

.field private static final TIMEZONE_GMT:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->TIMEZONE_GMT:Ljava/util/TimeZone;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkOffset(Ljava/lang/String;IC)Z
    .locals 1
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "expected"    # C

    .prologue
    .line 252
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static format(Ljava/util/Date;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 53
    const/4 v0, 0x0

    sget-object v1, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->TIMEZONE_GMT:Ljava/util/TimeZone;

    invoke-static {p0, v0, v1}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->format(Ljava/util/Date;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format(Ljava/util/Date;Z)Ljava/lang/String;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "millis"    # Z

    .prologue
    .line 64
    sget-object v0, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->TIMEZONE_GMT:Ljava/util/TimeZone;

    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->format(Ljava/util/Date;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format(Ljava/util/Date;ZLjava/util/TimeZone;)Ljava/lang/String;
    .locals 12
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "millis"    # Z
    .param p2, "tz"    # Ljava/util/TimeZone;

    .prologue
    const v11, 0xea60

    const/16 v10, 0x3a

    const/16 v7, 0x2d

    .line 76
    new-instance v0, Ljava/util/GregorianCalendar;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, p2, v6}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 77
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 80
    const-string v6, "yyyy-MM-ddThh:mm:ss"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v1

    .line 81
    .local v1, "capacity":I
    if-eqz p1, :cond_1

    const-string v6, ".sss"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    :goto_0
    add-int/2addr v1, v6

    .line 82
    invoke-virtual {p2}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "Z"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    :goto_1
    add-int/2addr v1, v6

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 85
    .local v2, "formatted":Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "yyyy"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 86
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    const-string v8, "MM"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 88
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    const/4 v6, 0x5

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "dd"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 90
    const/16 v6, 0x54

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 91
    const/16 v6, 0xb

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "hh"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 92
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    const/16 v6, 0xc

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "mm"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 94
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 95
    const/16 v6, 0xd

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "ss"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 96
    if-eqz p1, :cond_0

    .line 97
    const/16 v6, 0x2e

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    const/16 v6, 0xe

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const-string v8, "sss"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v2, v6, v8}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 101
    :cond_0
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    invoke-virtual {p2, v8, v9}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v5

    .line 102
    .local v5, "offset":I
    if-eqz v5, :cond_4

    .line 103
    div-int v6, v5, v11

    div-int/lit8 v6, v6, 0x3c

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 104
    .local v3, "hours":I
    div-int v6, v5, v11

    rem-int/lit8 v6, v6, 0x3c

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 105
    .local v4, "minutes":I
    if-gez v5, :cond_3

    move v6, v7

    :goto_2
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    const-string v6, "hh"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v2, v3, v6}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 107
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    const-string v6, "mm"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v2, v4, v6}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->padInt(Ljava/lang/StringBuilder;II)V

    .line 113
    .end local v3    # "hours":I
    .end local v4    # "minutes":I
    :goto_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 81
    .end local v2    # "formatted":Ljava/lang/StringBuilder;
    .end local v5    # "offset":I
    :cond_1
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 82
    :cond_2
    const-string v6, "+hh:mm"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    goto/16 :goto_1

    .line 105
    .restart local v2    # "formatted":Ljava/lang/StringBuilder;
    .restart local v3    # "hours":I
    .restart local v4    # "minutes":I
    .restart local v5    # "offset":I
    :cond_3
    const/16 v6, 0x2b

    goto :goto_2

    .line 110
    .end local v3    # "hours":I
    .end local v4    # "minutes":I
    :cond_4
    const/16 v6, 0x5a

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3
.end method

.method private static padInt(Ljava/lang/StringBuilder;II)V
    .locals 3
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "value"    # I
    .param p2, "length"    # I

    .prologue
    .line 298
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, "strValue":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int v0, p2, v2

    .local v0, "i":I
    :goto_0
    if-lez v0, :cond_0

    .line 300
    const/16 v2, 0x30

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 299
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 302
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    return-void
.end method

.method public static parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .locals 28
    .param p0, "date"    # Ljava/lang/String;
    .param p1, "pos"    # Ljava/text/ParsePosition;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 132
    const/4 v10, 0x0

    .line 134
    .local v10, "fail":Ljava/lang/Exception;
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v17

    .line 137
    .local v17, "offset":I
    add-int/lit8 v18, v17, 0x4

    .end local v17    # "offset":I
    .local v18, "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v24

    .line 138
    .local v24, "year":I
    const/16 v25, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_0

    .line 139
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move/from16 v18, v17

    .line 143
    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    :cond_0
    add-int/lit8 v17, v18, 0x2

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v15

    .line 144
    .local v15, "month":I
    const/16 v25, 0x2d

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_d

    .line 145
    add-int/lit8 v17, v17, 0x1

    move/from16 v18, v17

    .line 149
    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    :goto_0
    add-int/lit8 v17, v18, 0x2

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v7

    .line 151
    .local v7, "day":I
    const/4 v11, 0x0

    .line 152
    .local v11, "hour":I
    const/4 v14, 0x0

    .line 153
    .local v14, "minutes":I
    const/16 v19, 0x0

    .line 154
    .local v19, "seconds":I
    const/4 v13, 0x0

    .line 155
    .local v13, "milliseconds":I
    const/16 v25, 0x54

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 158
    add-int/lit8 v17, v17, 0x1

    add-int/lit8 v18, v17, 0x2

    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v11

    .line 159
    const/16 v25, 0x3a

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_1

    .line 160
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move/from16 v18, v17

    .line 163
    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    :cond_1
    add-int/lit8 v17, v18, 0x2

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v14

    .line 164
    const/16 v25, 0x3a

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_c

    .line 165
    add-int/lit8 v17, v17, 0x1

    move/from16 v18, v17

    .line 168
    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v25

    move/from16 v0, v25

    move/from16 v1, v18

    if-le v0, v1, :cond_b

    .line 169
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 170
    .local v4, "c":C
    const/16 v25, 0x5a

    move/from16 v0, v25

    if-eq v4, v0, :cond_b

    const/16 v25, 0x2b

    move/from16 v0, v25

    if-eq v4, v0, :cond_b

    const/16 v25, 0x2d

    move/from16 v0, v25

    if-eq v4, v0, :cond_b

    .line 171
    add-int/lit8 v17, v18, 0x2

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v19

    .line 173
    const/16 v25, 0x2e

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->checkOffset(Ljava/lang/String;IC)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 174
    add-int/lit8 v17, v17, 0x1

    add-int/lit8 v18, v17, 0x3

    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->parseInt(Ljava/lang/String;II)I

    move-result v13

    move/from16 v17, v18

    .line 182
    .end local v4    # "c":C
    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    :cond_2
    :goto_2
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v25

    move/from16 v0, v25

    move/from16 v1, v17

    if-gt v0, v1, :cond_5

    .line 183
    new-instance v25, Ljava/lang/IllegalArgumentException;

    const-string v26, "No time zone indicator"

    invoke-direct/range {v25 .. v26}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v25
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2

    .line 226
    .end local v7    # "day":I
    .end local v11    # "hour":I
    .end local v13    # "milliseconds":I
    .end local v14    # "minutes":I
    .end local v15    # "month":I
    .end local v17    # "offset":I
    .end local v19    # "seconds":I
    .end local v24    # "year":I
    :catch_0
    move-exception v8

    .line 227
    .local v8, "e":Ljava/lang/IndexOutOfBoundsException;
    move-object v10, v8

    .line 233
    .end local v8    # "e":Ljava/lang/IndexOutOfBoundsException;
    :goto_3
    if-nez p0, :cond_a

    const/4 v12, 0x0

    .line 234
    .local v12, "input":Ljava/lang/String;
    :goto_4
    invoke-virtual {v10}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    .line 235
    .local v16, "msg":Ljava/lang/String;
    if-eqz v16, :cond_3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v25

    if-eqz v25, :cond_4

    .line 236
    :cond_3
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "("

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ")"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 238
    :cond_4
    new-instance v9, Ljava/text/ParseException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Failed to parse date ["

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "]: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-direct {v9, v0, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .line 239
    .local v9, "ex":Ljava/text/ParseException;
    invoke-virtual {v9, v10}, Ljava/text/ParseException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 240
    throw v9

    .line 185
    .end local v9    # "ex":Ljava/text/ParseException;
    .end local v12    # "input":Ljava/lang/String;
    .end local v16    # "msg":Ljava/lang/String;
    .restart local v7    # "day":I
    .restart local v11    # "hour":I
    .restart local v13    # "milliseconds":I
    .restart local v14    # "minutes":I
    .restart local v15    # "month":I
    .restart local v17    # "offset":I
    .restart local v19    # "seconds":I
    .restart local v24    # "year":I
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v22

    .line 186
    .local v22, "timezoneIndicator":C
    const/16 v25, 0x2b

    move/from16 v0, v22

    move/from16 v1, v25

    if-eq v0, v1, :cond_6

    const/16 v25, 0x2d

    move/from16 v0, v22

    move/from16 v1, v25

    if-ne v0, v1, :cond_7

    .line 187
    :cond_6
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v23

    .line 188
    .local v23, "timezoneOffset":Ljava/lang/String;
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "GMT"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 189
    .local v21, "timezoneId":Ljava/lang/String;
    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v25

    add-int v17, v17, v25

    .line 197
    .end local v23    # "timezoneOffset":Ljava/lang/String;
    :goto_5
    invoke-static/range {v21 .. v21}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v20

    .line 198
    .local v20, "timezone":Ljava/util/TimeZone;
    invoke-virtual/range {v20 .. v20}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v3

    .line 199
    .local v3, "act":Ljava/lang/String;
    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_9

    .line 205
    const-string v25, ":"

    const-string v26, ""

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 206
    .local v6, "cleaned":Ljava/lang/String;
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_9

    .line 207
    new-instance v25, Ljava/lang/IndexOutOfBoundsException;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Mismatching time zone indicator: "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, " given, resolves to "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v20 .. v20}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 228
    .end local v3    # "act":Ljava/lang/String;
    .end local v6    # "cleaned":Ljava/lang/String;
    .end local v7    # "day":I
    .end local v11    # "hour":I
    .end local v13    # "milliseconds":I
    .end local v14    # "minutes":I
    .end local v15    # "month":I
    .end local v17    # "offset":I
    .end local v19    # "seconds":I
    .end local v20    # "timezone":Ljava/util/TimeZone;
    .end local v21    # "timezoneId":Ljava/lang/String;
    .end local v22    # "timezoneIndicator":C
    .end local v24    # "year":I
    :catch_1
    move-exception v8

    .line 229
    .local v8, "e":Ljava/lang/NumberFormatException;
    move-object v10, v8

    .line 232
    goto/16 :goto_3

    .line 190
    .end local v8    # "e":Ljava/lang/NumberFormatException;
    .restart local v7    # "day":I
    .restart local v11    # "hour":I
    .restart local v13    # "milliseconds":I
    .restart local v14    # "minutes":I
    .restart local v15    # "month":I
    .restart local v17    # "offset":I
    .restart local v19    # "seconds":I
    .restart local v22    # "timezoneIndicator":C
    .restart local v24    # "year":I
    :cond_7
    const/16 v25, 0x5a

    move/from16 v0, v22

    move/from16 v1, v25

    if-ne v0, v1, :cond_8

    .line 191
    const-string v21, "GMT"

    .line 192
    .restart local v21    # "timezoneId":Ljava/lang/String;
    add-int/lit8 v17, v17, 0x1

    goto :goto_5

    .line 194
    .end local v21    # "timezoneId":Ljava/lang/String;
    :cond_8
    new-instance v25, Ljava/lang/IndexOutOfBoundsException;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "Invalid time zone indicator "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 230
    .end local v7    # "day":I
    .end local v11    # "hour":I
    .end local v13    # "milliseconds":I
    .end local v14    # "minutes":I
    .end local v15    # "month":I
    .end local v17    # "offset":I
    .end local v19    # "seconds":I
    .end local v22    # "timezoneIndicator":C
    .end local v24    # "year":I
    :catch_2
    move-exception v8

    .line 231
    .local v8, "e":Ljava/lang/IllegalArgumentException;
    move-object v10, v8

    goto/16 :goto_3

    .line 212
    .end local v8    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v3    # "act":Ljava/lang/String;
    .restart local v7    # "day":I
    .restart local v11    # "hour":I
    .restart local v13    # "milliseconds":I
    .restart local v14    # "minutes":I
    .restart local v15    # "month":I
    .restart local v17    # "offset":I
    .restart local v19    # "seconds":I
    .restart local v20    # "timezone":Ljava/util/TimeZone;
    .restart local v21    # "timezoneId":Ljava/lang/String;
    .restart local v22    # "timezoneIndicator":C
    .restart local v24    # "year":I
    :cond_9
    new-instance v5, Ljava/util/GregorianCalendar;

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 213
    .local v5, "calendar":Ljava/util/Calendar;
    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->setLenient(Z)V

    .line 214
    const/16 v25, 0x1

    move/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v5, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 215
    const/16 v25, 0x2

    add-int/lit8 v26, v15, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v5, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 216
    const/16 v25, 0x5

    move/from16 v0, v25

    invoke-virtual {v5, v0, v7}, Ljava/util/Calendar;->set(II)V

    .line 217
    const/16 v25, 0xb

    move/from16 v0, v25

    invoke-virtual {v5, v0, v11}, Ljava/util/Calendar;->set(II)V

    .line 218
    const/16 v25, 0xc

    move/from16 v0, v25

    invoke-virtual {v5, v0, v14}, Ljava/util/Calendar;->set(II)V

    .line 219
    const/16 v25, 0xd

    move/from16 v0, v25

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 220
    const/16 v25, 0xe

    move/from16 v0, v25

    invoke-virtual {v5, v0, v13}, Ljava/util/Calendar;->set(II)V

    .line 222
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 223
    invoke-virtual {v5}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v25

    return-object v25

    .line 233
    .end local v3    # "act":Ljava/lang/String;
    .end local v5    # "calendar":Ljava/util/Calendar;
    .end local v7    # "day":I
    .end local v11    # "hour":I
    .end local v13    # "milliseconds":I
    .end local v14    # "minutes":I
    .end local v15    # "month":I
    .end local v17    # "offset":I
    .end local v19    # "seconds":I
    .end local v20    # "timezone":Ljava/util/TimeZone;
    .end local v21    # "timezoneId":Ljava/lang/String;
    .end local v22    # "timezoneIndicator":C
    .end local v24    # "year":I
    :cond_a
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v26, 0x22

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "\'"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_4

    .restart local v7    # "day":I
    .restart local v11    # "hour":I
    .restart local v13    # "milliseconds":I
    .restart local v14    # "minutes":I
    .restart local v15    # "month":I
    .restart local v18    # "offset":I
    .restart local v19    # "seconds":I
    .restart local v24    # "year":I
    :cond_b
    move/from16 v17, v18

    .end local v18    # "offset":I
    .restart local v17    # "offset":I
    goto/16 :goto_2

    :cond_c
    move/from16 v18, v17

    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    goto/16 :goto_1

    .end local v7    # "day":I
    .end local v11    # "hour":I
    .end local v13    # "milliseconds":I
    .end local v14    # "minutes":I
    .end local v18    # "offset":I
    .end local v19    # "seconds":I
    .restart local v17    # "offset":I
    :cond_d
    move/from16 v18, v17

    .end local v17    # "offset":I
    .restart local v18    # "offset":I
    goto/16 :goto_0
.end method

.method private static parseInt(Ljava/lang/String;II)I
    .locals 7
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xa

    .line 265
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-gt p2, v4, :cond_0

    if-le p1, p2, :cond_1

    .line 266
    :cond_0
    new-instance v4, Ljava/lang/NumberFormatException;

    invoke-direct {v4, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 269
    :cond_1
    move v1, p1

    .line 270
    .local v1, "i":I
    const/4 v3, 0x0

    .line 272
    .local v3, "result":I
    if-ge v1, p2, :cond_5

    .line 273
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 274
    .local v0, "digit":I
    if-gez v0, :cond_2

    .line 275
    new-instance v4, Ljava/lang/NumberFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid number: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 277
    :cond_2
    neg-int v3, v0

    .line 279
    .end local v0    # "digit":I
    :goto_0
    if-ge v2, p2, :cond_4

    .line 280
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 281
    .restart local v0    # "digit":I
    if-gez v0, :cond_3

    .line 282
    new-instance v4, Ljava/lang/NumberFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid number: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 284
    :cond_3
    mul-int/lit8 v3, v3, 0xa

    .line 285
    sub-int/2addr v3, v0

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_0

    .line 287
    .end local v0    # "digit":I
    :cond_4
    neg-int v4, v3

    return v4

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_5
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_0
.end method

.method public static timeZoneGMT()Ljava/util/TimeZone;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/fasterxml/jackson/databind/util/ISO8601Utils;->TIMEZONE_GMT:Ljava/util/TimeZone;

    return-object v0
.end method
