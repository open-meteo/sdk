package com.openmeteo.sdk;

import com.openmeteo.sdk.SeriesAndTime;
import com.openmeteo.sdk.Series;
import javax.annotation.Nullable;

public final class SeriesSearch {
    public SeriesAndTime series;
    public int variable;
    public int aggregation;
    public int altitude;
    public int pressureLevel;
    public int depth;
    public int depthTo;
    public int ensembleMember;

    public SeriesSearch(SeriesAndTime series) {
        this.series = series;
    }

    public SeriesSearch variable(int variable) {
        this.variable = variable;
        return this;
    }

    public SeriesSearch aggregation(int aggregation) {
        this.aggregation = aggregation;
        return this;
    }

    public SeriesSearch altitude(int altitude) {
        this.altitude = altitude;
        return this;
    }

    public SeriesSearch pressureLevel(int pressureLevel) {
        this.pressureLevel = pressureLevel;
        return this;
    }

    public SeriesSearch depth(int depth) {
        this.depth = depth;
        return this;
    }

    public SeriesSearch depthTo(int depthTo) {
        this.depthTo = depthTo;
        return this;
    }

    public SeriesSearch ensembleMember(int ensembleMember) {
        this.ensembleMember = ensembleMember;
        return this;
    }

    private boolean match(Series s) {
        if (this.variable != 0 && s.variable() != this.variable) {
            return false;
        }
        if (this.aggregation != 0 && s.aggregation() != this.aggregation) {
            return false;
        }
        if (this.altitude != 0 && s.altitude() != this.altitude) {
            return false;
        }
        if (this.pressureLevel != 0 && s.pressureLevel() != this.pressureLevel) {
            return false;
        }
        if (this.depth != 0 && s.depth() != this.depth) {
            return false;
        }
        if (this.depthTo != 0 && s.depthTo() != this.depthTo) {
            return false;
        }
        if (this.ensembleMember != 0 && s.ensembleMember() != this.ensembleMember) {
            return false;
        }
        return true;
    }

    private int count() {
        int count = 0;
        for (int i = 0; i < series.seriesLength(); i++) {
            var s = series.series(i);
            if (this.match(s)) {
                count++;
            }
        }
        return count;
    }

    public @Nullable Series first() {
        for (int i = 0; i < series.seriesLength(); i++) {
            var s = series.series(i);
            if (this.match(s)) {
                return s;
            }
        }
        return null;
    }

    public Series[] search() {
        var result = new Series[this.count()];
        int pos = 0;
        for (int i = 0; i < series.seriesLength(); i++) {
            var s = series.series(i);
            if (this.match(s)) {
                result[pos] = s;
                pos++;
            }
        }
        return result;
    }
}